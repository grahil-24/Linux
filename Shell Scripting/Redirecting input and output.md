The Bash shell provides a few different operators that allow you to _redirect_ the output of a command to an alternative location (such as a file). Redirection can be used for input as well as output, redirecting a file to a command for input

<h4> Output Redirection </h4>
The most basic type of redirection is sending output from a command to a file. The Bash shell uses the greater-than symbol (`>`) for this:

```
command> outputfile
```

Anything that would appear on the monitor from the command instead is stored in the output file specified

Eg: date > test6

The redirect operator created the file `test6` (using the default `umask` settings) and redirected the output from the `date` command to the `test6` file. If the output file already exists, the redirect operator overwrites the existing file with the new file data.

Sometimes, instead of overwriting the file's contents, you may need to append output from a command to an existing file — for example, if you're creating a log file to document an action on the system. In this situation, you can use the double greater-than symbol (`>>`) to append data.


<h4> Input Redirection </h4>
input redirection takes the content of a file and redirects it to a command.
Eg: wc < test6

The `wc` command provides a count of text in the data. By default, it produces three values:
- The number of lines in the text
- The number of words in the text
- The number of bytes in the text

There's another method of input redirection, called inline input redirection. 
Eg: ```
command << marker
data
marker
```
```
fdsfgs


<h3>Employing Pipes </h3>
Say we want to sort the output of the command rpm -qa. This command lists packages installed. If we want to sort this we can do it by redirection. That is saving it in a file then reading and sorting it using redirection. But this is sort of unnecessary. We can redirect the output directly to another command using 'piping'