
<h3>1.  Passing Parameters </h3>
The most basic method of passing data to your shell script is to use _command-line parameters_. Command-line parameters allow you to add data values to the command line when you execute the script. Eg: 

./script 10 30

this examples passes two command line parameters 10 and 30 to the script. The command line parameters are handled using special variables. 

<h5> Reading the parameters: </h5>
they are also called positional parameters. It also includes the name of the script we are executing. $0 being the scripts name, $1 being the first parameter, $2 the second and so on. 

If you want to enter more command-line parameters for your script, each parameter must be separated by a space on the command line. And the shell assigns each parameter to the appropriate variable.

You can also use text strings as parameters:

Remember that the parameters are separated by spaces, so the shell interpreted the space as just separating the two values. To include a space as a parameter value, you must use quotation marks (either single or double quotation marks).

If your script needs more than nine command-line parameters, you can continue, but the variable names change slightly. After the ninth variable, you must use braces around the variable number, such as `${10}`.

-> basename command -
suppose we run the script with the command ./script.sh or full path of the script. the $0 will be ./script.sh or the full path respectively and not just script.sh. basename is useful here to extract only the name of the script. 
	Eg: 
		`#!/bin/bash` 
		`# Using basename with the $0 command-line parameter` 
		`#` 
		`name=$(basename $0)` 
		`#` 
		`echo This script name is $name.` 
		`exit`


<h5> Testing the parameters </h5>
If the script is run without the needed parameters, bad things can happen

When the script assumes there is data in a parameter variable and no data is present, most likely you'll get an error message from your script. This is a poor way to write scripts. Always check your parameters to make sure the data is there before using it.

the `-n` test evaluation is one of the method to check for data in the  command-line parameter.

If the script requires multiple parameters, checking each one of them gets tedious. so the shell provides a way to get the number of parameters passed using $#. 


Eg: getting the last parameter - 

`#!/bin/bash`
`# Testing grabbing the last parameter` 
`#` `echo The number of parameters is $#` 
`echo The last parameter is ${!#}` 
`exit`

*note*: Inside the {} $ cant be use. use ! instead

<h5> Grabbing all the data </h5>
the $* and $@ variables provide a good way to access all the parameters. The $* variables treats all the parameters as one parameter.
The $@ variable treats them as separate words in same string. It allows us to iterate through the values. Mostly accomplished through for loop. 
Eg: grabbing all params using $@ and looping through them: 
	#!/bin/bash
	
	count=1
	for param in "$@"
	do
		echo "parameter $count is $param"
		count=$[ $count + 1]
	done
	exit


<h5> Shift command </h5>
Shift command helps to manipulate command line parameters.The `shift` command literally shifts the command-line parameters in their relative positions.

When you use the `shift` command, it moves each parameter variable one position to the left by default. Thus, the value for variable `$3` is moved to `$2` , the value for variable `$2` is moved to `$1` , and the value for variable `$1` is discarded (note that the value for variable `$0` , the program name, remains unchanged).

This is another great way to iterate through command-line parameters. You can just operate on the first parameter, shift the parameters over, and then operate on the first parameter again.

eg: 
	#!/bin/bash
	echo 
	echo "using the shift method:"
	count=1
	while [ -n "$1" ]
	do
		echo "parameter $count is $1"
		count=$[ $count + 1 ]
		shift
	done
	exit

*note*: When parameter is shifted out, its value is lost, and cant be recovered

Alternatively, you can perform a multiple location shift by providing a parameter to the `shift` command. Just provide the number of places you want to shift: 
		shift 2


<h4> Options </h4>
rm -r. Here -r is known as an option. They alter the behaviour of a command. 

<h6> processing options:</h6>
#!/bin/bash

while [ -n "$1" ]
do
	case "$1" in
		-a) echo "found the -a option" ;;
		-b) echo "found the -b option" ;;
		*) echo "$1 is not an option" ;;
	esac
	shift
done
exit

<h4> Separating options from parameters </h4>
We need some indication to indicate that user has entered the options and is now entering parameters. usually its '--'

Eg: 

	#!/bin/bash
	
	while [ -n "$1" ]
	do
		case "$1" in
			-a) echo "found the -a option" ;;
			-b) echo "found the -b option" ;;
			-c) echo "found the -c option" ;;
			--) shift
			   break;;
			*) echo "$1 is not an option" ;;
		esac
		shift
	done
	
	echo
	count=1
	for param in $@
	do
		echo "parameter $count is $param"
		count=$[ $count + 1 ]
	done
	echo
	exit


It is a common practice in Linux to combine options, and if your script is going to be user-friendly, you'll want to offer this feature for your users as well. Fortunately, there's another method for processing options that can help you.

<h3> getopt command </h3>
A great tool to process command-line options and parameters. 

The command looks something like - 

getopt optstring parameters

where opstring is the key to the process. It denotes the letters which can be used as command line options. and parameters are the options which require  a parameter value.

If you specify a parameter option not in the _`_optstring_`_, by default the `getopt` command produces an error message:

```
$ getopt ab:cd -a -b BValue -cde test1 test2
```

If you prefer to just ignore the error messages, use `getopt` with the `-q` option

Eg: 
	getopt ab:cd -a -b val -c -d param1 param2
	 -a -b val -c -d -- param1 param2


<h3>2.  Getting user input </h3>
read command to get the input from the user while the script is running. 
Eg: 

	#!/bin/bash
	echo -n "enter your name: "
	read name
	echo "your name is $name"

the -n option for echo suppresses the newline character at the end of string, allowing the user to give the input in the same line. 

instead of echo, we can use -p option with read command

```
read -p "Please enter your age: " age
```

the `read` command assigns both the first name and last name to the same variable. The `read` command assigns all data entered at the prompt to a single variable, or you can specify multiple variables. Each data value entered is assigned to the next variable in the list. If the list of variables runs out before the data does, the remaining data is assigned to the last variable

<h5> Timing out </h5>
Can use the -t option to specify timer. After that amount of time, the read command returns a non-zero exit status.

Eg: 
	#!/bin/bash
	
	if read -t 5 -p "enter your name" name
	then
		echo "hi $name"
	else
		echo "sorry no longer waiting for name"
	fi

Instead of timing the input, you can also set the `read` command to count the input characters. When a preset number of characters has been entered, the script automatically continues (the user does not have to press the Enter key)

Eg: 
	
	#!/bin/bash
	
	read -n 1 -p "Do you want to continue [Y/n]? " answer
	
	case $answer in 
		Y | y) echo
			echo "ok continue on...";;
		N | n) echo
			echo "ok exiting..."
			exit;;
	esac


<h5> Hiding data while user is typing </h5>
eg: password
use the -s option with the read command

Eg:
	
	#!/bin/bash
	
	read -s -p "enter your password" password
	echo 
	echo "your password is $password"


<h5> Reading from a file </h5>
Can also use the read command to read data from a file in the linux system. Each call to the read, reads a single line from the file till there are none left. 

Eg: 

	#!/bin/bash
	
	count=1
	cat $HOME/pig_1711018739651.log | while read line
	do
		echo "line $count: $line"
		count=$[ $count + 1 ]
	done