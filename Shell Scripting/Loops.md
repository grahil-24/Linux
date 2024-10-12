
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
<h5> Reading a directory using wildcards </h5>
Finally, you can use the `for` command to automatically iterate through a directory of files. To do this, you must use a wildcard character in the file or pathname. This forces the shell to use _file globbing_. File globbing is the process of producing filenames or pathnames that match a specified wildcard character.


<h4> Iterator style for loop </h4>
#!/bin/bash

for (( a = 1; a < 10; a++ ))
do      
        echo $a
done    

#####  Using multiple variables

The C-style `for` command also allows you to use multiple variables for the iteration. The loop handles each variable separately, allowing you to define a different iteration process for each variable. Although you can have multiple variables, you can define only one condition in the `for` loop:

```
for (( a=1, b=10; a <= 10; a++, b-- ))
do
	echo "$a - $b"
done

```
<h2>2. While loop </h2>
basic structure :

while test command
do 
	other commands
done

The key to the `while` command is that the exit status of the _`_test command_`_ specified must change, based on the commands run during the loop. If the exit status never changes, the `while` loop will get stuck in an infinite loop.

Eg:
var=10
while [ $var -gt 0 ]
do
	echo $var
	 var1=$[ $var1 - 1 ]
done


<h3> Nesting Loops </h3>
A loop statement can use any other type of command within the loop, including other loop commands. This is called a _nested loop_
`#!/bin/bash`
`# nesting for loops` 
`for (( a = 1; a <= 3; a++ ))`
`do` 
	`echo "Starting loop $a:"` 
	`for (( b = 1; b <= 3; b++ ))` 
	`do` 
		`echo " Inside loop: $b"` 
		`done` 
`done`


<h3> Controlling the loop </h3>
<h4> 1. Break command </h4>
break out of a loop in progress. Works in any type of loop. 
Eg: 

`for var1 in 1 2 3 4 5 6 7 8 9 10`
`do`
	`if [ $var1 -eq 5 ]`
	 `then` 
		 `break` 
	`fi` 
	`echo "Iteration number: $var1"` 
`done`

The `for` loop should normally have iterated through all the values specified in the list. However, when the `if-then` condition was satisfied, the shell executed the `break` command, which stopped the `for` loop.


