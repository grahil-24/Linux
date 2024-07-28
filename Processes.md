
When the system boots up, the kernels creates a process called **init** (or sometimes systemd), it has a PID of 1. The init process can't be terminated unless the system shuts down. It runs with root privileges and runs many processes that keep the system running.

=> Process creation - 
	When a new process is created, an existing process basically clones itself using something called the fork system call (system calls will be discussed very far into the future). The fork system call creates a mostly identical child process, this child process takes on a new process ID (PID) and the original process becomes its parent process and has something called a parent process ID **PPID**. Afterwards, the child process can either continue to use the same program its parent was using before or more often use the execve system call to launch up a new program. This system call destroys the memory management that the kernel put into place for that process and sets up new ones for the new program


- ps l

	The l option gives us a "long format" or even more detailed view of our running processes. You'll see a column labelled **PPID**, this is the parent ID. Now look at your terminal, you'll see a process running that is your shell, so on my system I have a process running bash. Now remember when you ran the ps l command, you were running it from the process that was running bash. Now you'll see that the **PID** of the bash shell is the **PPID** of the **ps l** command.

=> process details - 
	1 .A process like we said before is a running program on the system, more precisely it's the system allocating memory, CPU, I/O to make the program run.

	2. The kernel is in charge of processes, when we run a program the kernel loads up the code of the program in memory, determines and allocates resources and then keeps tabs on each process, it knows:

- The status of the process
- The resources the process is using and receives
- The process owner
- Signal handling (more on that later)
- And basically everything else

Processes are the programs that are running on your machine. They are managed by the kernel and each process has an ID associated with it called the **process ID (PID).** This PID is assigned in the order that processes are created.

    PID TTY          TIME CMD
   5463  pts/0    00:00:03 zsh
   5549  pts/0    00:00:00 zsh
   5554  pts/0    00:00:00 gitstatusd-linu
   9614  pts/0    00:00:00 ps

PID - process id 
TTY - controlling terminal associated with the process. 
TIME - total cpu usage time 
CMD - command used to start the process. 


-- ps aux

The **a** displays all processes running, including the ones being ran by other users. The **u** shows more details about the processes. And finally the **x** lists all processes that don't have a TTY associated with it, these programs will show a ? in the TTY field, they are most common in daemon processes that launch as part of the system startup.

You'll notice you're seeing a lot more fields now, no need to memorize them all, in a later course on advanced processes, we'll go over some of these again:

- USER: The effective user (the one whose access we are using)
- PID: Process ID
- %CPU: CPU time used divided by the time the process has been running
- %MEM: Ratio of the process's resident set size to the physical memory on the machine
- VSZ: Virtual memory usage of the entire process
- RSS: Resident set size, the non-swapped physical memory that a task has used
- TTY: Controlling terminal associated with the process
- STAT: Process status code
- START: Start time of the process
- TIME: Total CPU usage time
- COMMAND: Name of executable/command


=> Process termination - 
	A process can exit, using the \_exit system call, this will free up the resources, the process was using. It lets, the system know why it was being terminated, with the help of a termination status. 


=> Controlling Terminal - 

The TTY is the terminal that executed the command. There are two types of terminals, regular **terminal devices** and **pseudoterminal devices**. A regular terminal device is a native terminal device that you can type into and send output to your system, this sounds like the terminal application you've been launching to get to your shell, but it's not.

A pseudoterminal is what you've been used to working in, they emulate terminals with the shell terminal window and are denoted by PTS . If you look at ps again, you'll see your shell process under pts/*

Some processes are bound to a terminal. If we close that terminal, the process goes with it. But some are not. They are denoted with ? in ps's output in the tty column. They run in the background. Eg: daemon processes. 


