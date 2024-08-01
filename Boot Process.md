
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

2. upstart: This is the init you'll find on older Ubuntu installations. Upstart uses the idea of jobs and events and works by starting jobs that performs certain actions in response to events.
4. systemd:  New standard for init, which is goal oriented. Basically there are goals, which systemd tries to achieve by satisfying the goal's dependecies. 