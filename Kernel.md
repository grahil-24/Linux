
Kernel is the core of the operating system.

kernel is mainly responsible for 4 main functions - 
1. system memory management
2. software program management
3. hardware management
4. filesystem management


<h4>1.System Memory management </h4>

Memory is grouped into blocks called pages. The kernel locates each page in memory either in physical memory or swap space. It then maintains a table of the memory pages indicating its location. When a page in the physical memory has not been used for a long time, the kernel brings it over to the swap space. When a swapped out page is required by a program, the kernel brings in the page to the physical mem from the swap space. 

<h4>2. Software program management </h4>
Kernel controls how linux system manages all the processes running in the system. It creates the first process - the init process, which in turn starts other necessary processes. Currently systemd is the most popular init process in different linux distros. 

<h4>3. Hardware Management </h3>
Driver code needs to be present in the kernel for the device to communicate with the hardware or an application. Two types of drivers - 
1. Driver compiled in the kernel - previously when a new driver was added to the kernel, the whole kernel was needed to be recompiled which was not so efficient. 
2. Driver module added to kernel - driver modules could be inserted into a running kernel, without the need to recompile the kernel. Also when the device was finished being used, the module could be removed.

The linux system identifies hardware devices as files called device files. There are 3 types - 
1. Character
2. block
3. network 

Character device files are for devices that can handle data only one character at a time. Most types of modems and terminals are created as character files. Block files are for devices that can handle data in large blocks at a time, such as disk drives.

The network file types are used for devices that use packets to send and receive data. This includes network cards and a special loopback device that allows the Linux system to communicate with itself using common network programming protocols.

Linux creates special files, called _nodes_, for each device on the system. All communication with the device is performed through the device node. Each node has a unique number pair that identifies it to the Linux kernel. The number pair includes a major and a minor device number. Similar devices are grouped into the same major device number. The minor device number is used to identify a specific device within the major device group.


Linux operating system is organized into 3 different levels of abstraction: 

1. Hardware - disks, networking ports, cpu, memory etc. 
2. kernel - handles process, memory management, device communication, system calls, setting up filesystems. It is main interface between physical hardware and the processes running on it. 
3. user space - GUI, softwares, programs, shells etc.


<h4>=> Privilege Levels: </h4>
Userspace and kernel exist and operate seperately as both are present in different modes. Userspace is in user mode, whereas kernel is in kernel mode. 

In kernel mode, the kernel has complete access to the hardware, it controls everything. In user space mode, there is a very small amount of safe memory and CPU that you are allowed to access. Basically, when we want to do anything that involves hardware, reading data from our disks, writing data to our disks, controlling our network, etc, it is all done in kernel mode

These different modes are called privilege levels (aptly named for the levels of privilege you get) and are often described as protection rings. The rings work the same way, the innermost ring corresponds to the highest privilege level. There are two main levels or modes in an x86 computer architecture. Ring #3 is the privilege that user mode applications run in, Ring #0 is the privilege that the kernel runs in. Ring #0 can execute any system instruction and is given full trust

 
<h4> System Calls:</h5>
Syscalls provide user space processes a way to request the kernel to do something for us. They are like an interface between the usermode (application) and the kernel mode. The kernel makes certain services available through the system call API. These services allow us to read or write to a file, modify memory usage, modify our network, etc. The amount of services are fixed, so you can't be adding system calls nilly willy, your system already has a table of what system calls exist and each system call has a unique ID.

Syscalls are generally not called directly but rather via wrapper functions in glibc or some other directories.  For eg: c function printf is just a wrapper of the syscall write.


When a machine is started, the CPU starts in ring 0 privilege, after which it drops down to level 3. Now the hardware is kind of locked down. We can only enter level 0 again through a syscall, but we cannot control what can be executed because the address is fixed. 

![[Pasted image 20240803210355.png]]


You can actually view the system calls that a process makes with the strace command. The strace command is useful for debugging how a program executed.



to see the current kernel version use the command - 
	uname -r

- uname prints the system info while -r flag prints the kernel version


<h4>Where is the kernel located? </h4>
When we install a kernel, files are usually added to the /boot directory. Multiple files exist for different kernel versions - 
	1. vmlinuz - actual linux kernel 
	2. initrd - temporary file system, used before loading the kernel
	3. System.map - symbolic look up table
	4. config - kernel configuration settings

if the /boot is running out of space, we can always remove the older versions. Though this is not required as package manager does this. 


<h4>Kernel modules: </h4>
Modules are some extensions of a kernel which provide some extra functionalities. They are not built into the kernel and can be loaded and unloaded externally safely and on demand. To view currently loaded modules - 
	lsmod

-> To load a module - 
	sudo modprobe bluetooth

	- What modprobe does is, that it tries to load the modules from /lib/modules/kernelversion/kernel/drivers, and also loads the dependencies of the module we are trying to load

-> to unload a module - 
	sudo modprobe -r bluetooth

-> Instead of temporarily loading them, we can also load them up on bootup. For this we need to modify the /etc/modprobe.d directory and add  a config file in it. For eg: 


	rahil@fedora:~$ /etc/modprobe.d/my-modules.conf
	
	options nf_conntrack type={some_kernel_parameter}

-> to remove a module from being loaded during bootup- 

	rahil@fedora:~$ /etc/modprobe.d/my-modules.conf
	
	blacklist nf_conntrack


	