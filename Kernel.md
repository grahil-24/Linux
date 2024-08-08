
Kernel is the core of the operating system. 

Linux operating system is organized into 3 different levels of abstraction: 

1. Hardware - disks, networking ports, cpu, memory etc. 
2. kernel - handles process, memory management, device communication, system calls, setting up filesystems. It is main interface between physical hardware and the processes running on it. 
3. user space - GUI, softwares, programs, shells etc.


<h4>=> Privilege Levels: </h4>
Userspace and kernel exist and operate seperately as both are present in different modes. Userspace is in user mode, whereas kernel is in kernel mode. 

In kernel mode, the kernel has complete access to the hardware, it controls everything. In user space mode, there is a very small amount of safe memory and CPU that you are allowed to access. Basically, when we want to do anything that involves hardware, reading data from our disks, writing data to our disks, controlling our network, etc, it is all done in kernel mode

These different modes are called privilege levels (aptly named for the levels of privilege you get) and are often described as protection rings. The rings work the same way, the innermost ring corresponds to the highest privilege level. There are two main levels or modes in an x86 computer architecture. Ring #3 is the privilege that user mode applications run in, Ring #0 is the privilege that the kernel runs in. Ring #0 can execute any system instruction and is given full trust