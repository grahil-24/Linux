
to know the priorities of process use the command - ps -l

F S   UID     PID       PPID     C PRI  NI ADDR SZ    WCHAN  TTY          TIME CMD
0 S  1000   29109   29059  0  80   0 - 57487    do_wai pts/0         00:00:00 bash
0 T  1000   29205   29109  1  80   0 - 59254     do_sig pts/0          00:00:00 vim
4 R  1000   29211   29109  0   80   0 - 57816 -      pts/0                 00:00:00 ps


to know the priority, the priority and niceness column are the most important. niceness value indicates, that if niceness if positive 1-20(highest is 20). The higher the niceness value, "nicer" the process is to other processes. if a process has 20 niceness value, then it will have the lowest priority possible. If it has niceness value of -20, it will have the highest priority possible. by default the priority and niceness values are 80 and 0 respectively. 

Priority of process can be changed by using renice command - 

sudo renice -10 -p 29205. this sets the niceness value to -10 for process having PID 29205. 

renice is used to change priority of existing processes. What if we want to set priority of a new process? This can be done with nice command 

Eg: nice -n 10 vim



