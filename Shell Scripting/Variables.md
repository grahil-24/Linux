 Often you'll want to incorporate other data in your shell commands to process information. You can do this by using _variables_. Variables allow you to temporarily store information within the shell script for use with other commands in the script. This section shows how to use variables in your shell scripts.
We can even use environment variables available in the linux system in our shell scripts.


<h4> User variables - </h4> 
User variables can be any text string of up to 20 letters, digits, or underscore characters. User variables are case sensitive, so the variable  Var1 is different from the variable  var1.
Values are assigned to user variables using an equal sign. No spaces can appear between the variable, the equal sign, and the value.

Just like system variables, user variables can be referenced using the dollar sign: 

Eg: ```
#!/bin/bash
days=10
guest="Rahil"
echo "$guest checked in $days ago!"
days=5
echo "$guest checked in $days ago!"

It's important to remember that when referencing a variable value you use the dollar sign, but when referencing the variable to assign a value to it, you do not use the dollar sign. Eg: 

	value1=10
	 value2=$value1

Without the dollar sign, the shell interprets the variable name as a normal text string, which is most likely not what you wanted.