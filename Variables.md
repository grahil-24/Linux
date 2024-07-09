
myvar="Hello world"

now we have created a variable named myvar. 

to access the variable use the command ${var_name}

to see the value of variable, echo ${var_name}

some predefined environment variables - $HOME, $USER. To see all env variables, use the command-  env

environment variables are in all caps. 

- What are environment variables?



file_list=$(ls -l /etc)
output of ls -l /etc is stored in variable file_list
