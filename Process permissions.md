
There are effectively three UIDs associated with each process -
	1. Effective UID - When we launch a new process, it runs with the same permission as that of the user or group which ran it. This uid is used to grant access to a process 
	2. real UID - UID of the user which started it. used to track down the user
	3. SUID - 