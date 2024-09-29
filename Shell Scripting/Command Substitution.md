One of the most useful features of shell scripts is the ability to extract information from the output of a command and assign it to a variable. Once you assign the output to a variable, you can use that value anywhere in your script. This comes in handy when you're processing data in your scripts.
There are two ways to assign the output of a command to a variable:
- The backtick character
- The `$()` format

Eg: testing=$(date)

Command substitution creates what's called a subshell to run the enclosed command. A subshell is a separate child shell generated from the shell that's running the script. Because of that, any variables that you create in the script won't be available to commands running in the subshell.