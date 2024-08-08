	
When the system boots up, the kernels creates a process called **init** (or sometimes systemd), it has a PID of 1. The init process can't be terminated unless the system shuts down. It runs with root privileges and runs many processes that keep the system running.

Everything in linux is a file. Even the processes. They are stored in a file system called /proc.

	ls /proc
	- processes should be listed as directories, with the PID as the name of the dir. 

	cat /proc/1/status
	- this file contains the status and more information about the process of PID 1(systemd or init)

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

Most commonly a status of 0 means that the process succeeded. However, that's not enough to completely terminate a process. The parent process has to acknowledge the termination of the child process by using the wait system call and what this does is it checks the termination status of the child process.

   -> Orphan processes: 
	   When a parent process dies before a child process, the kernel knows that it's not going to get a wait call, so instead it makes these processes "orphans" and puts them under the care of init (remember mother of all processes). Init will eventually perform the wait system call for these orphans so they can die.

  -> Zombie processes: 
	What happens when a child terminates and the parent process hasn't called wait yet? We still want to be able to see how a child process terminated, so even though the child process finished, the kernel turns the child process into a zombie process. The resources the child process used are still freed up for other processes, however there is still an entry in the process table for this zombie. Zombie processes also cannot be killed, since they are technically "dead", so you can't use signals to kill them. Eventually if the parent process calls the wait system call, the zombie will disappear, this is known as "reaping". If the parent doesn't perform a wait call, init will adopt the zombie and automatically perform wait and remove the zombie. It can be a bad thing to have too many zombie processes, since they take up space on the process table, if it fills up it will prevent other processes from running.



=> Controlling Terminal - 

The TTY is the terminal that executed the command. There are two types of terminals, regular **terminal devices** and **pseudoterminal devices**. A regular terminal device is a native terminal device that you can type into and send output to your system, this sounds like the terminal application you've been launching to get to your shell, but it's not.

A pseudoterminal is what you've been used to working in, they emulate terminals with the shell terminal window and are denoted by PTS . If you look at ps again, you'll see your shell process under pts/*

Some processes are bound to a terminal. If we close that terminal, the process goes with it. But some are not. They are denoted with ? in ps's output in the tty column. They run in the background. Eg: daemon processes. 


=> Niceness -

- Process use the CPU for a little amount of time known as a time slice. Then, it pauses for a few milliseconds, and lets the other process use the CPU in a round robin fashion. 
- This switching of processes is handled by the kernel. 
- Process dont get to decide how much time will they get to use the CPU for. Normally, its equal for all processes. 
- But this time can be varied by changing the "niceness" value. 
- The "niceness" value usually denotes the priority number of the process. Higher the niceness, lower is the priority and vice-versa. 
- Niceness can be checked using the top or htop command

	-- to change the niceness value - 
		Eg: nice -n 5 dnf upgrade

	nice is for setting niceness value for new processes. To change the niceness value for existing processes, renice is used - 
		Eg: renice 10 -p {process_id}


=> Process states: 
	ps aux to check for process states in the STAT column. 

	1. R: running or runnable, it is just waiting for the CPU to process it
	2. S: sleeping. interruptable sleep, waiting for an event to complete. Such as input from terminal
	3. D: uninterruptable sleep, processes, that cannot be killed or interrupted with a signal. 
	4. Z: zombie process. terminated processes, waiting for their statuses to be collected
	5. T: process that has been suspended or stopped. 



<h4>=> Process Utilization: </h4>
1. Tracking processes (Top): 

	top - 22:46:07 up 36 min,  1 user,  load average: 0.47, 0.50, 0.46
Tasks: 402 total,   1 running, 400 sleeping,   0 stopped,   1 zombie
%Cpu(s):  0.4 us,  0.4 sy,  0.0 ni, 98.6 id,  0.0 wa,  0.5 hi,  0.1 si,  0.0 st 
MiB Mem :   7275.5 total,    477.8 free,   4204.8 used,   2987.7 buff/cache     
MiB Swap:   7275.0 total,   6578.5 free,    696.5 used.   3070.7 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND                                                                                                
   2752     rahil           20   0  6098616  154196  67848 S     4.3       2.1         2:08.07 gnome-shell                                                                                            
   5989      rahil          20   0 1687280     52116   30916 S     1.3       0.7        0:02.95    kitty 


First line - shows the current time, uptime, how many users are logged in and system load(average)

Second line - tasks that are running, sleeping, stopped, zombied

Third line - CPU info
- us: user CPU time - Percentage of CPU time spent running users’ processes that aren’t niced.
- sy: system CPU time - Percentage of CPU time spent running the kernel and kernel processes
- ni: nice CPU time - Percentage of CPU time spent running niced processes
- id: CPU idle time - Percentage of CPU time that is spent idle
- wa: I/O wait - Percentage of CPU time that is spent waiting for I/O. If this value is low, the problem probably isn’t disk or network I/O
- hi: hardware interrupts - Percentage of CPU time spent serving hardware interrupts
- si: software interrupts - Percentage of CPU time spent serving software interrupts
- st: steal time - If you are running virtual machines, this is the percentage of CPU time that was stolen from you for other tasks

-------------------------------------------------------------------
**Note: What are nice and un-nice processes?** 

	A "niced" process is one that has been run with the `nice` command (or whose niceness has been changed by `renice`) and an "un-niced" process is one that hasn't been run with `nice`. The default nice values for regular processes (those which haven't been run with `nice command` or whose niceness hasn't subsequently been changed by `renice PID`) is 0. So, "un-niced" processes are those with a nice value of 0 and "niced" processes are those with a nice value != 0.
------------------------------------------------------------------------

4th and 5th line - Memory and Swap usage

**Processes List that are Currently in Use**

1. PID: Id of the process
2. USER: user that is the owner of the process
	1. PR: Priority of process
3. NI: The nice value
4. VIRT: Virtual memory used by the process
5. RES: Physical memory used from the process
6. SHR: Shared memory of the process
7. S: Indicates the status of the process: S=sleep, R=running, Z=zombie,D=uninterruptible,T=stopped
8. %CPU - this is the percent of CPU used by this process
9. %MEM - percentage of RAM used by this process
10. TIME+ - total time of activity of this process
11. COMMAND - name of the process


-> lsof and fuser - 

	1. lsof - To see what is in use by a process, you can use the lsof command (short for "list open files") this will show you a list of all the open files and their associated process.

	2. fuser - Another way to track a process is the fuser command (short for "file user"), this will show you information about the process that is using the file or the file user.


<h4>Process threads: </h4>

aka lightweight processes. 
If a process has one thread it is single-threaded and if a process has more than one thread it is multi-threaded. However, all processes have at least one thread. Processes operate with their own isolated system resources, however threads can share these resources among each other easily, making it easier for them to communicate among each other and at times it is more efficient to have a multi-threaded application than a multi-process application.

To view process threads we can use the command - ps m. The processes are denoted with each PID and underneath the processes are their threads (denoted by a --). 

<h4>CPU Monitoring:</h4>

uptime is a good command for CPU monitoring. Load averages are good way to see the CPU load on your system. These numbers represent the average CPU load in 1, 5, and 15 minute intervals. The CPU load is the average number of processes that are waiting to be executed by the CPU. 

uptime
 23:16:52 up  1:54,  1 user,  load average: 1.82, 2.01, 2.01



The max load is determined the number of cores in cpu. For eg: if its a single core, the max load the CPU can reach is 1. If dual core then 2 and so on. To view the number of cores in your cpu - 

		cat /proc/cpuinfo


<h4>IO Monitoring: </h4>

iostat. 

avg-cpu:  %user   %nice %system %iowait  %steal   %idle
          10.65    0.00    4.60            0.12      0.00   84.62

Device             tps         kB_read/s    kB_wrtn/s    kB_dscd/s     kB_read    kB_wrtn    kB_dscd
nvme0n1         130.38      1203.90      1097.41       3127.72    8553378    7796797   22221544
zram0             145.69       114.70         468.20          0.00          814912      3326428          0

- %user - Show the percentage of CPU utilization that occurred while executing at the user level (application)
- %nice - Show the percentage of CPU utilization that occurred while executing at the user level with nice priority.user CPU utilization with nice priorities
- %system - Show the percentage of CPU utilization that occurred while executing at the system level (kernel).
- %iowait - Show the percentage of time that the CPU or CPUs were idle during which the system had an outstanding disk I/O request.
- %steal - Show the percentage of time spent in involuntary wait by the virtual CPU or CPUs while the hypervisor was servicing another virtual processor.
- %idle - Show the percentage of time that the CPU or CPUs were idle and the system did not have an outstanding disk I/O request.

- tps - Indicate the number of transfers per second that were issued to the device. A transfer is an I/O request to the device. Multiple logical requests can be combined into a single I/O request to the device. A transfer is of indeterminate size.
- kB_read/s - Indicate the amount of data read from the device expressed in kilobytes per second.
- kB_wrtn/s - Indicate the amount of data written to the device expressed in kilobytes per second.
- kB_read - The total number of kilobytes read.
- kB_wrtn - The total number of kilobytes written.


<h4>Memory Monitoring:</h4>

