<h4>Standard file descriptors </h4>
Linux identifies each file object using a file descriptor. Its a non negative integer that uniquely identifies open files in a session. Each process is allowed to have 9 file descriptors open at a time. First three (0, 1 and 2) file descriptors are reserved for special purposes

**Linux Standard File Descriptors**

| File Descriptor | Abbreviation | Description     |
| --------------- | ------------ | --------------- |
| 0               | `STDIN`      | Standard input  |
| 1               | `STDOUT`     | Standard output |
| 2               | `STDERR`     | Standard error  |

<h3> 1. STDIN </h3>
this file descriptor references standard input to the shell. The shell receives input from the keyboard on the `STDIN` file descriptor and processes each character as you type it.

When you use the input redirect symbol (<), Linux replaces the standard input file descriptor with the file referenced by the redirection. It reads the file and retrieves data just as if it were typed on the keyboard. Many Bash commands accept input from `STDIN` , especially if no files are specified on the command line. Eg: cat

<h3> 2. STDOUT </h3>
References the standard output of the shell. The standard output by default is the terminal monitor. Another way is output redirection(> or >>). With the output redirection symbol, all the output that normally would go to the monitor is instead redirected to the designated redirection file by the shell.

When a command produces an error message, the shell doesn't redirect the error message to the output redirection file. The shell created the output redirection file, but the error message appeared on the monitor screen, not in the file. The shell handles error messages separately from the normal output.

<h3> 3. STDERR </h3>
The shell handles error messages using the special `STDERR` file descriptor. The `STDERR` file descriptor references the standard error output for the shell. This is the location where the shell sends error messages generated by the shell or programs and scripts running in the shell.

By default, the `STDERR` file descriptor points to the same place as the `STDOUT` file descriptor (even though they are assigned different file descriptor values). This means that, by default, all error messages go to the monitor display.


<h3> Redirecting Errors </h3>
As the value of file descriptor for stderr is 2 we use 2> instead of > to redirect errors to file. 
Eg: 
		```
		ls -al badfile 2> test4
		```
Both errors and data can be redirected too. Both > and 2> have to be used for that. Eg:

		ls -al test test2 test3 badtest 2> test6 1> test7

The shell redirects the normal output of the `ls` command that would have gone to `STDOUT` to the `test7` file using the `1>` symbol. Any error messages that would have gone to `STDERR` were redirected to the `test6` file using the `2>` symbol.

We can also output both stdout and stderr to the same file using &> symbol. Eg: 

	ls -al test test2 test3 badtest &> test7

The bash shell gives errors a higher priority than stdout messages. This allows us to view error messages together rather than being scattered in the output file. 


<h3> Redirecting outputs in scripts </h3>
1. Temporary redirections: 

	If you want to purposely generate error messages in your script, you can redirect an individual output line to `STDERR` . You just need to use the output redirection symbol to redirect the output to the `STDERR` file descriptor. When you redirect to a file descriptor, you must precede the file descriptor number with an ampersand (`&`). Eg:

		`#!/bin/bash` 
		`# testing STDERR messages` 
		`echo "This is an error">&2`

	This method is great for generating error messages in shell scripts.

2. Permanent redirections: 

	