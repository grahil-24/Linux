
<h2> 1. For loop </h2>

The Bash shell provides the `for` command to allow you to create a loop that iterates through a series of values. Each iteration performs a defined set of commands using one of the values in the series. Here's the basic format of the Bash shell `for` command:

```
 for var in list
 do
	 commands
done
```

In each iteration, the variable _`_var_`_ contains the current value in the list. The first iteration uses the first item in the list, the second iteration the second item, and so on, until all the items in the list have been used.

	After the last iteration, the `$test` variable remains valid throughout the remainder of the shell script. It retains the last iteration value


Changing the field separator:
The cause of this problem is the special environment variable `IFS` , the _internal field separator_. The `IFS` environment variable defines a list of characters the Bash shell uses as field separators. By default, the Bash shell considers the following characters as field separators:

- A space
- A tab
- A newline

To solve this problem, you can temporarily change the `IFS` environment variable values in your shell script to restrict the characters the Bash shell recognizes as field separators. For example, if you want to change the `IFS` value to recognize only the newline character, you need to do this:

```
IFS=$'\n'
```

Eg: 
```
`#!/bin/bash` 
`# reading values from a file` 
`file="states.txt"`
`IFS=$'\n'
` 
`for state in $(cat $file)` 
`do` 
	`echo "Visit beautiful $state"` 
`done`
```
```
```

Suppose you want to iterate through values in a file that are separated by a colon (such as in the `/etc/passwd` file). You just need to set the `IFS` value to a colon:

	IFS=:
If you want to specify more than one `IFS` character, just string them together on the assignment line:

```
 IFS=$'\n':;"
```




