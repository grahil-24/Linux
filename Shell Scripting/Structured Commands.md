
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
The `test` command provides a way to test different conditions in an `if-then` statement. If the condition listed in the `test` command evaluates to `TRUE` , the `test` command exits with a zero exit status code. This makes the `if-then` statement behave in much the same way that `if-then` statements work in other programming languages. If the condition is false, the `test` command exits with a non-zero exit status code, which causes the `if-then` statement to exit.

It is also used to check if a variable has content. If it does not a non zero exit code is returned. 

The Bash shell provides an alternative way of testing a condition without declaring the `test` command in an `if-then` statement:

`if [ _condition_ ]` 
`then`
	`_commands_` 
`fi`

The square brackets define the test condition. Be careful: there _must_  be a space after the first bracket and a space before the last bracket, or you'll get an error message.

The `test` command and test conditions can evaluate three classes of conditions:

- Numeric comparisons
- String comparisons
- File comparisons

<h4> 2.1 Numeric comparisons </h4>
		-gt : greater than
		-eq : equal to


<h4> 2.2 String Comparisons </h4>

|_`str1`_ `=` _`str2`_|Checks if _`str1`_ is the same as string _`str2`_.|
|_`str1`_ `!=` _`str2`_|Checks if _`str1`_ is not the same as _`str2`_.|
|_`str1`_ `<` _`str2`_|Checks if _`str1`_ is less than _`str2`_.|
|_`str1`_ `>` _`str2`_|Checks if _`str1`_ is greater than _`str2`_.|
|`-n` _`str1`_|Checks if _`str1`_ has a length greater than zero.|
|`-z` _`str1`_|Checks if _`str1`_ has a length of zero.|

The script interpreted the greater-than symbol as an output redirection ). Thus, it creates a file called str2 with str1 as text in it . Because the redirection completed successfully, the test condition returns a zero exit status code, which the `if` statement evaluates as though things completed successfully!
To fix this problem, you need to properly escape the greater-than symbol using the backslash (`\`).

`#!/bin/bash`
`# Properly using string comparisons`
`#` 
`string1=soccer`
`string2=zorbfootball` 
`#`
`if [ $string1 \> $string2 ]`
`then`
	`echo "$string1 is greater than $string2"`
 `else`
	  `echo "$string1 is less than $string2"`
 `fi`

Capitalized letters are treated as less than lowercase letters in test comparisons. However, the `sort` command does the opposite. When you put the same strings in a file and use the `sort` command, the lowercase letters appear first. This is due to different ordering techniques.

Test comparisons use standard Unicode ordering, using each character's Unicode numeric value to determine the sort order. The `sort` command uses the sorting order defined for the system locale language settings. For the English language, the locale settings specify that lowercase letters appear before uppercase letters in sorted order.

<h5> String Size </h5>
-n and -z are used to test the length of a string


<h4> 3. File Comparisons </h4>
This category allows you to test the status of files and directories on the Linux filesystem

| Comparison                | Description                                                                      |
| ------------------------- | -------------------------------------------------------------------------------- |
| `-d` _`file`_             | Checks if _`file`_ exists and is a directory.                                    |
| `-e` _`file`_             | Checks if _`file`_ exists.                                                       |
| `-f` _`file`_             | Checks if _`file`_ exists and is a file.                                         |
| `-r` _`file`_             | Checks if _`file`_ exists and is readable.                                       |
| `-s` _`file`_             | Checks if _`file`_ exists and is not empty.                                      |
| `-w` _`file`_             | Checks if _`file`_ exists and is writable.                                       |
| `-x` _`file`_             | Checks if _`file`_ exists and is executable.                                     |
| `-O` _`file`_             | Checks if _`file`_ exists and is owned by the current user.                      |
| `-G` _`file`_             | Checks if _`file`_ exists and the default group is the same as the current user. |
| _`file1`_ `-nt` _`file2`_ | Checks if _`file1`_ is newer than _`file2`_.                                     |
| _`file1`_ `-ot` _`file2`_ | Checks if _`file1`_ is older than _`file2`_.                                     |

<h5> Checking directories </h5>
`#!/bin/bash`
`# Look before you leap`
`#`
`jump_directory=/home/Torfa` 
`#` 
`if [ -d $jump_directory ]` 
`then` 
	`echo "The $jump_directory directory exists."` 
	`cd $jump_directory` 
	`ls` 
`else`
	`echo "The $jump_directory directory does NOT exist."` 
`fi`x

The `-d` test condition checks to see if the `jump_directory` variable's directory exists. If it does, it proceeds to use the `cd` command to change to the current directory and performs a directory listing. If it does not, the script emits a warning message and exits the script.


<h5> Checking for a file </h5>
-e is used to check for both directory or a file while -f is used to check for only a file. 


<h5> Checking for read access </h5>
-r used to check if file has read access. 
Eg:

`#!/bin/bash` 
`# Check if you can read a file`
`#` 
`pwfile=/etc/shadow`
`echo`
`echo "Checking if you can read $pwfile..."` 
`#` 
`# Check if file exists and is a file.` 
`#` 
`if [ -f $pwfile ]` 
`then` 
	`# File does exist. Check if can read it.` 
	`#` 
	`if [ -r $pwfile ]`
	 `then` 
		 `echo "Displaying end of file..."` 
		 `tail $pwfile`
          `#` 
    `else` 
	          `echo "Sorry, read access to $pwfile is denied."`
	`fi`
	    `#`
`else` 
	`echo "Sorry, the $pwfile file does not exist."` 
`fi`


<h5> Checking for empty file </h5>
-s to check if file is empty or not. If the file has data in it then -s comparison succeeds. 

<h5> Checking whether if we can write to a file </h5>
The `-w` comparison determines whether you have permission to write to a file.

<h5> Checking if we can run a file </h5>
-x comparison can be used to see if we can execute a particular file. 

<h5> Checking ownership </h5>
-O comparison allows us to test whether we are the owner of a file 

<h5> Checking default group membership </h5>
-G comparison checks the group of a file. It succeeds if it matches the default group of the user. It does not match to all the group the user belongs to, only its default group. 

<h5> Checking file date </h5>
The last set of comparisons deal with comparing the creation times of two files. This comes in handy when writing scripts to install software. Sometimes, you don't want to install a file that is older than a file already installed on the system.

The `-nt` comparison determines whether a file is newer than another file. If a file is newer, it has a more recent file creation time. The `-ot` comparison determines whether a file is older than another file. If the file is older, it has an older file creation time

`#!/bin/bash` 
`# Compare two file's creation dates/times` 
`#`
`if [ $HOME/Downloads/games.rpm -nt $HOME/software/games.rpm ]
`then`
	`echo "The $HOME/Downloads/games.rpm file is newer"` 
	`echo "than the $HOME/software/games.rpm file."`
 `#` 
 `else`
	  `echo "The $HOME/Downloads/games.rpm file is older"` 
	  `echo "than the $HOME/software/games.rpm file."` 
`#` 
`fi`


<h3> Compound testing </h3>
The `if-then` statement allows you to use Boolean logic to combine tests. You can use these two Boolean operators:

- `[ condition1 ] && [ condition2 ]`
- `[ condition1 ] || [ condition2 ]`

The first Boolean operation uses the `AND` Boolean operator to combine two conditions. Both conditions must be met for the `then` section to execute.
The second Boolean operation uses the `OR` Boolean operator to combine two conditions. If either condition evaluates to a `TRUE` condition, the `then` section is executed.

<h4> Working with Advanced if-then features </h4>
1. Single parentheses for running the command in a subshell

	Before the Bash shell executes the _`_command_`_, it creates a subshell in which to run the command. If the command completes its task successfully, the exit status is set to zero, and the commands listed under the `then` section are executed. If the exit status of the command is anything else, the `then` commands aren't executed. Eg:

	`#!/bin/bash`
	 `# Testing a single parentheses condition`
	 `#` 
	 `echo $BASH_SUBSHELL` 
	 `#`
	 `if (echo $BASH_SUBSHELL)` 
	 `then` 
		 `echo "The subshell command operated successfully."` 
	`#` 
	`else`
		`echo "The subshell command was NOT successful."` 
	`#` 
	`fi`


2.  Double parentheses for mathematical expressions
	The _double parentheses_ command allows you to incorporate advanced mathematical formulas in your comparisons. The `test` command allows for only simple arithmetic operations in the comparison. The double parentheses command provides more mathematical symbols, which programmers who have used other programming languages may be familiar with using.

		`#!/bin/bash` 
		`# Testing a double parentheses command` 
		`#` 
		`val1=10` 
		`#` 
		`if (( $val1 ** 2> 90 ))` 
		`then` 
			`(( val2 = $val1 ** 2 ))` 
			`echo "The square of $val1 is $val2,"` 
			`echo "which is greater than 90."` 
		`#` 
		`fi`
		
3. Double square brackets for advanced string handling functions

The _double bracket_ command provides advanced features for string comparisons. Here's the double bracket command format:
```
[[ expression ]]
```

`#!/bin/bash`
`# Using double brackets for pattern matching` 
`#`
`#`
`if [[ $BASH_VERSION == 5.* ]]`
`then` 
	`echo "You are using the Bash Shell version 5 series."` 
`fi` 
`$`


