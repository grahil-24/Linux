
An interactive utility, which provides a way for users to start programs, manage processes, files in the filesystem etc. The core of the shell is the command prompt, which is the interactive part of the shell. It allows users to enter commands, which are interpreted and then executed in the kernel. 
Has some inbuilt commands to manage files, text manipulation, process management etc. It also allows the user to pass the name of the program, which is then passed of to the kernel to start it.  Default is the bash shell. 

Several other shells are also available like zsh, fish etc.  To list all the installed shells - cat /etc/shells. You can see some shells are present in both /usr/bin and /bin. In modern linux distros, /bin is a symlink to /usr/bin

echo $0 prints the current shell. also echo $SHELL works too. 

<h3>Parent and Child shell relationships</h3>
Subshell allows us to execute commands in a different shell environment. A subshell is a child shell, spawned by the main shell (aka parent shell). It is seperate env, with its own set of variables and command history. To run a command in child shell - 

(command1; command2; command3)

One thing for which a child shell can be used is to run commands in a modified environment, and automating some tasks in a shell script.

Also a subshell is created when a shell script is executed. 
Another way in which subshell are spawned are using process lists. Process list is nothing but command list run in subshell. What are command lists? Commands chained together seperated by ; 

Eg: pwd; ls; cd /etc; pwd
This command is executed in current shell. To execute it in a subshell, surround the list with parenthesis ie (pwd; ls; cd /etc; pwd)

to check if a subshell was created a variable called $BASH_SUBSHELL can be checked. Append this at the end of process list to verify. If the output of echo $BASH_SUBSHELL is 0, means a new subshell was not created. Grandchild shell can also be created using double parenthesis

Eg: (pwd; (echo $ZSH_SUBSHELL))

-> by running  processes in the background, we can do a large amount of multiprocessing within a subshell. 


Putting a process or process list in background is not the only way to use subshells effectively. Co processing is another method. 

<h4>Coprocesses </h4>
It does two thing at the same time - spawns a subshell in background, and executes the command in that subshell. It is done with the help of the coproc command.  By default the job name is COPROC. You can give a custom job name too - 
			coproc my_job {sleep 10; }

Default coproc name is sufficient in most cases. Its only necessary when you have multiple processes in the background, and you need them to communicate between each other. 

