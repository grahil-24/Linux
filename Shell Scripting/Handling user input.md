
<h3>1.  Passing Parameters </h3>
The most basic method of passing data to your shell script is to use _command-line parameters_. Command-line parameters allow you to add data values to the command line when you execute the script. Eg: 

./script 10 30

this examples passes two command line parameters 10 and 30 to the script. The command line parameters are handled using special variables. 

<h5> Reading the parameters: </h5>
they are also called positional parameters. It also includes the name of the script we are executing. $0 being the scripts name, $1 being the first parameter, $2 the second and so on. 

If you want to enter more command-line parameters for your script, each parameter must be separated by a space on the command line. And the shell assigns each parameter to the appropriate variable.

