
data streams - 
	how Linux handles inputs, outputs and errors. 

	3 datastreams - 
		1. Standard input
		2. standard output
		3. standard error

	when we run echo $?, it returns the status code of the previous command. If the output was 1 then, the previous command has returned an error. if 0, it ran successfully. Not necessary if the output does not have error, or permission denied or "could not find" or anything like that to indicate it ran successfully. Try running the command - find /etc -type -f. this command lists all files inside the /etc directory. But as we did not give any target file as argument, we got a status code of 1, but not any error in the output. 

To filter out stderr and only include stdout, we use the command find /etc -type f 2> /dev/null. Stderr is represented by 2. stdin is 0 and stdout is 1. This command redirects stderr to /dev/null. /dev/null is sort of a blackhole. It effectively deletes anything we move into it. if we dont use a number in the command, stdout is taken into consideration by default	


