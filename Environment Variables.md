Bash shell uses feature called environment variables to store info about shell session and working env. Two types of env variables - 
1. Global Variables
2. Local variables

Global environment variables are visible from the shell session and any spawned child session. Local env variables are only visible in shell in which they were created. System env variables are in all caps to differentiate from user created env variables. 

To view all global environment variables use the env or printenv command. To get the value of a environment variable, printenv is used. Eg: 
		printenv HOME
or even echo can be used  - 
			echo $HOME
dollar indicates that it is not a literal string but a variable. Its not only for echo but can be passed as parameter to other commands to.Eg:
				ls $HOME


No command which shows only local variables. set shows both local and global env variables. 


<h4>Creating local user defined variables </h4>
my_variable=Hello
echo $my_variable

Now the variable "my_variable" is available to use anywhere in the current shell process. However if a new shell is spawned, it wont be. If the variable was created in a child shell, it wont be available in the parent shell. To make a local variable global, we use the export command. Dont use $ when exporting tho. 

export my_variable. 

We can create and export variables in one command - 
export my_variable="Hello World"

If we change the value of a global variable in the child shell, it wont affect the variable in the parent shell. 


<h4>Removing Environment Variables </h4>
to remove an existing environment variables, we can use the command unset. Eg: 

	unset my_variable

Unsetting a global env in a child subshell, does not affect it in the parent shell. 


<h2>PATH environment variables</h2>

