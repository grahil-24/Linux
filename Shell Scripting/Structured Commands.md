
If-then is an example of Structured command 

<h3> 1. If-then</h3>
If block executed if the command in condition returns an exit code of 0. fi marks the end of if-then statements. 

`if grep $testuser /etc/passwd` 
`then` 
	`echo "The script files in the home directory of $testuser are:"` `ls /home/$testuser/*.sh`

`else`
	`echo "The user $testuser does not exist on this system."` 
	`echo`
 `fi` 
`echo "We are outside the if statement"`


<h4> Nesting Ifs </h4>

`#!/bin/bash` 
`# testing nested ifs`
`#` 
`testuser=NoSuchUser`
`#` 
`if grep $testuser /etc/passwd` 
`then`
	`echo "The user $testuser account exists on this system."` 
	`echo`
 `else` 
	 `echo "The user $testuser does not exist on this system."` 
	 `if ls -d /home/$testuser/` 
	 `then`
		 `echo "However, $testuser has a directory."`
	 `fi` 
`fi`
`echo "We are outside the nested if statements."`


The problem with using this manner of nested `if-then` statements in a script is that the code can get hard to read, and the logic flow becomes difficult to follow. Instead of having to write separate `if-then` statements, you can use an alternative version of the `else` section called `elif` . The `elif` continues an `else` section with another `if-then` statement:

`#!/bin/bash`
`# testing nested ifs - using elif` 
`#` 
`testuser=NoSuchUser` 
`#` 
`if grep $testuser /etc/passwd`
`then`
	`echo "The user $testuser account exists on this system."`
	 `echo` 
`elif ls -d /home/$testuser/` 
`then` 
	`echo "The user $testuser has a directory,"` 
	`echo "even though $testuser doesn't have an account."` 
`fi` 
`echo "We are outside the nested if statements."`


<h3> 2. Test </h3>
