
we can give a command some custom name, through which we can call it. Eg: 

alias mycmd="ls -lh". When i call mycmd, it executes the command ls -lh. 

To remove an alias - 

unalias {aliasname} 


If there is a command with the same name as the alias. The alias command is executed and not the original one. 

Aliases are only specific to a particular shell. To make it permanent, we can put it into the .bashrc file. 