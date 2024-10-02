
Every command that runs in the shell uses the exit status to indicate to the shell that its done processing. The exit status is an integer between 0 and 255. to check the exit status of the last command you executed you can use the command echo $?

By default the exit code for successful execution is 0. If theres an error the exit code is some positive integer. 

| Code    | Description                          |
| ------- | ------------------------------------ |
| 0       | Successful completion of the command |
| 1       | General unknown error                |
| 2       | Misuse of shell command              |
| 126     | The command can't execute            |
| 127     | Command not found                    |
| 128     | Invalid exit argument                |
| 128+_x_ | Fatal error with Linux signal _x_    |
| 130     | Command terminated with Ctrl+C       |
| 255     | Exit status out of range             |
By default the script exits with the exit code of the last command in the script. But we can give a custom exit code if we want using the exit command. Eg: 

#!/bin/bash
var1=10
var2=10
var3=\$[$var1 + $var2]
echo the answer is $var3
exit 5

we can also use variable in exit command - exit $var3. The exit code can only go up to 255. If it exceeds, that then the code is wrapped around. 