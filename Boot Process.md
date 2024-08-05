
Linux boot process consists of 4 steps - 

1. BIOS - Basic Input Output System. Makes sure with POST(Power on Self test) that all hardware is good to go. It also initialises the bootloader. 
2. Boot loader - Boot loader loads the kernel into the memory and starts the kernel parameters. The most common bootloader for linux is GRUB. 
3. Kernel  - When the kernel is loaded, it initialises the memory and devices. It also starts up the init/systemd process. 
4. Systemd/init  - It is the first process that ever gets started, and manages essential system services. 


<h4>1. Bios:</h4>
BIOS boots up the hard drive, it searches for the boot block to figure out how to boot up the system. Depending on how you partition your disk, it will look to the master boot record (MBR) or GPT. The MBR is located in the first sector of the hard drive, the first 512 bytes. The MBR contains the code to load another program somewhere on the disk, this program in turn actually loads up our bootloader.

Now if you partitioned your disk with GPT, the location of the bootloader changes a bit.

 <b>--> UEFI </b> 
Unified Extensible Firmware Interface. The first sector of a GPT disk is reserved for a "protective MBR" to make it possible to boot a BIOS-based machine.


 UEFI stores all info about startup in an .efi file located in EFI partition, which also contains the bootloader. 


<h4>2. Bootloader:</h4>

Most popular on linux is the GRUB bootloader. Its job is to load the OS, select a kernel and specify its parameters. 

bootloader's main goal is to load up the kernel, but where does it find the kernel? To find it, we will need to look at our kernel parameters. The parameters can be found by going into the GRUB menu on startup using the 'e' key. If you don't have GRUB no worries, we'll go through the boot parameters that you will see:

- initrd - Specifies the location of initial RAM disk (we'll talk more about this in the next lesson).
- BOOT_IMAGE - This is where the kernel image is located
- root - The location of the root filesystem, the kernel searches inside this location to find init. It is often represented by it's UUID or the device name such as /dev/sda1.
- ro - This parameter is pretty standard, it mounts the fileystem as read-only mode.
- quiet - This is added so that you don't see display messages that are going on in the background during boot.
- splash - This lets the splash screen be shown.


#### 3. Kernel:

Intird vs Initramfs:

- Not all drivers are available to the kernel on start up. So we need a temporary root file system where all the essential modules are kept which kernel uses to get to the hardware. In older versions, of linux this was done by initial ram disk (initrd). Initially kernel would mount initrd to access all the bootup drivers, and then replace it with the actual root file system. 
- In newer versions initramfs is used, which is a temporary root file system already build inside the kernel, and need not be mounted. 


-> Mounting the root file system- 

- When the kernel has all the modules it needs, it mounts the root filesystem, but initially in read mode only, when fsck checks for system integrity. After checking is done, kernel remounts the root filesystem in read and write mode, after which it locates the init process and executes it. 


<h4>4. init process: </h4>
Three major implementations of init in linux - 

1. System v init (sysv): This is the traditional init system. It sequentially starts and stops processes, based on startup scripts. The state of the machine is denoted by runlevels, each runlevel starts or stops a machine in a different way.
2.  upstart: This is the init you'll find on older Ubuntu installations. Upstart uses the idea of jobs and events and works by starting jobs that performs certain actions in response to events.
3.  systemd:  New standard for init, which is goal oriented. Basically there are goals, which systemd tries to achieve by satisfying the goal's dependecies. 



<h4>Types of Init processes in linux: </h4>
<h5>1. System V </h5>

To find out if you are using the Sys V init implementation, if you have an /etc/inittab file you are most likely running Sys V.

Sys V starts and stops processes sequentially, so let's say if you wanted to start up a service named foo-a, well before foo-b can work, you have to make sure foo-a is already running. Sys V does that with scripts, these scripts start and stop services for us, we can write our own scripts or most of the time use the ones that are already built in the operating system and are used to load essential services

The pros of using this implementation of init, is that it's relatively easy to solve dependencies, since you know foo-a comes before foo-b, however performance isn't great because usually one thing is starting or stopping at a time.

When using Sys V, the state of the machine is defined by runlevels which are set from 0 to 6. These different modes will vary depending on the distribution, but most of the time will look like the following:

- 0: Shutdown
- 1: Single User Mode
- 2: Multiuser mode without networking
- 3: Multiuser mode with networking
- 4: Unused
- 5: Multiuser mode with networking and GUI
- 6: Reboot

When your system starts up, it looks to see what runlevel you are in and executes scripts located inside that runlevel configuration. The scripts are located in **/etc/rc.d/rc[runlevel number].d/** or **/etc/init.d**. Scripts that start with S(start) or K(kill) will run on startup and shutdown, respectively. The numbers next to these characters are the sequence they run in.
To find out what runlevel your machine is booting into, you can see the default runlevel in the /etc/inittab file. You can also change your default runlevel in this file as well.


<h5>2. Upstart</h5>
Developed by canonical to be an improvement over the existing system v. Newer version of ubuntu have shifted to Systemd. Upstart was created to improve upon the issues with Sys V, such as the strict startup processes, blocking of tasks, etc. Upstart's event and job driven model allow it to respond to events as they happen.
To find out if you are using Upstart, if you have a /usr/share/upstart directory that's a pretty good indicator.
Jobs are the actions that Upstart performs and events are messages that are received from other processes to trigger jobs. To see a list of jobs and their configuration:

The way that Upstart works is that:

1. First, it loads up the job configurations from /etc/init
2. Once a startup event occurs, it will run jobs triggered by that event.
3. These jobs will make new events and then those events will trigger more jobs
4. Upstart continues to do this until it completes all the necessary jobs


<h5>3. Systemd: </h5>

Systemd uses goals to get your system up and running. Basically you have a target that you want to achieve and this target also has dependencies that we need to achieve. Systemd is extremely flexible and robust, it does not follow a strict sequence to get processes started. Here's what happens during the typical systemd boot:

1. First, systemd loads its configuration files, usually located in /etc/systemd/system or /usr/lib/systemd/system
2. Then it determines its boot goal, which is usually default.target
3. Systemd figures out the dependencies of the boot target and activates them

Similar to Sys V runlevels, systemd boots into different targets:

- poweroff.target - shutdown system
- rescue.target - single user mode
- multi-user.target - multiuser with networking
- graphical.target - multiuser with networking and GUI
- reboot.target - restart


-> Systemd goals: 

	Here is a basic service unit file: foobar.service

  
	[Unit]
	  
	Description=My Foobar
	  
	Before=bar.target
	
	[Service]
	  
	ExecStart=/usr/bin/foobar

	[Install]
	  
	WantedBy=multi-user.target

This is a simple service target, at the beginning of the file we see a section for [Unit], this allows us to give our unit file a description as well as control the ordering of when to activate the unit. The next portion is the [Service] section, under here we can start, stop or reload a service. And the [Install] section is used for dependency.


- to list all units - 
		systemctl list-units

- to view status of a unit
		systemctl status NetworkManager
- to start a service
		sudo systemctl start NetworkManager

- to stop its systemctl stop
- restart - systemctl restart
- enable - systemctl enable
- disable - systemctl disable