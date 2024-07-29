
- A signal is a notification to a process, that something has happened
- They are software interrupts
- They are ways in which processes communicate with each other
- Hardware, software issues, and kernel wants to inform a process. 
- Special terminal characters like ctrl + z or ctrl + c are some types of signals used to kill or suspend processes. 


-> Signal process- 
1. Signal until delivered, is in pending state
2. A process can do multitude of things with the signal when delivered like - 
	a. ignore signal
	b. block it, using signal masks
	c. process can be terminated, rather than normal exit system call
	d. catch the signal and perform a specific handler routine


-> Some common signals - 
1. SIGHUP/1 - signal for hangup
2. SIGINT/2 - interrupt
3. SIGKILL/9 - kill
4. SIGSEGV/11 - segmentation fault
5. SIGTERM/15 - software termination
6. SIGSTOP - stop


- some signals are blockable and some are not. Eg of an  unblockable signal - SIGKILL.

Command for terminating a process - 
		kill {process_id}
	- by default this sends a TERM signal
	- TERM allows the process to cleanly release its resources and save its state

 - to send some other signal - 
		kill -{signal_num} {process_id}

	Eg: kill -9 12345
		- This will send a SIGKILL signal. 


=> Differences between SIGHUP, SIGINT, SIGTERM, SIGKILL, SIGSTOP - 

- SIGHUP - Hangup, sent to a process when the controlling terminal is closed. For example, if you closed a terminal window that had a process running in it, you would get a SIGHUP signal. So basically you've been hung up on
- SIGINT - Is an interrupt signal, so you can use Ctrl-C and the system will try to gracefully kill the process
- SIGTERM - Kill the process, but allow it to do some cleanup first
- SIGKILL - Kill the process, kill it with fire, doesn't do any cleanup
- SIGSTOP - Stop/suspend a process


