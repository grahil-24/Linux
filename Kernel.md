
Kernel is the core of the operating system. 

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


	