The Bash calculator is actually a programming language that allows you to enter floating-point expressions at a command line and then interprets the expressions, calculates them, and returns the result. The Bash calculator recognizes the following:

- Numbers (both integer and floating point)
- Variables (both simple variables and arrays)
- Comments (lines starting with a pound sign or the C language `/* */` pair)
- Expressions
- Programming statements (such as `if-then` statements)
- Functions
You can access the Bash calculator from the shell prompt using the `bc` command

The floating-point arithmetic is controlled by a built-in variable called _`_scale_`_. You must set this value to the desired number of decimal places you want in your answers or you won't get what you were looking for:

Eg:
$ bc -q
3.44 / 5
0 
scale = 4
3.44/5
.688
quit
$

The default value for the scale variable is 0. 

<h4>Using bc in Scripts </h4>

Basic format: variable=$(echo "options; expression" | bc)

When using multiple expression, this structure can get confusing. So inline redirection is more preferable. 

variable=$(bc << EOF
		options
		statements
		expressions
		 EOF
		 )
		