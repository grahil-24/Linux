
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

