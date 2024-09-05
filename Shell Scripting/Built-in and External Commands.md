
to check if command is built in or external, type command is used. Eg: type cd
													cd is a shell builtin

<h3>External Commands </h3>

Also sometimes called as filesystem commands. They are usually present in /bin, /usr/bin, /usr/sbin, /sbin. To check where the command's program is present usually which, whereis and type command is used. 

eg: which ps
/usr/bin/ps

eg: type ps
ps is /usr/bin/ps


When an external command is executed,  a child process is created. The creation of child process is known as forking. External commands are a little slow, as when they are executed, the parent process takes some time in forking, and setting up the child process's new environment. 

When using a built in command forking is not required and hence is a bit computationally less expensive. 

