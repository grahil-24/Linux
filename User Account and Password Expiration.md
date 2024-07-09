
from chage command.

-> Eg: sudo chage -E 2024-10-01 neo

sets the expiration date for the user neo. After that date, the user "neo" would no longer be able to access the system. 

	sudo chage -l neo

- this shows expiration details of password and user for the user "neo"


-> Eg: sudo chage -M 30 trinity

	after 30 days the password for user "trinity" expires. 


	to reverse this use -1 in the days argument like this - 

	sudo chage -M -1 trinity



-> sudo chage -m 7 trinity

	what does this is, it sets a minimum number of days after which the password can be changed again. In this case, 7 days. 


-> sudo passwd -l trinity

	this locks the trinity account





User Management - 

1. Adding a user - 

	sudo useradd username - in some distros, the home directory for the user would also be automatically created. But to make sure, just add the -m option like this - sudo useradd -m username


	**Bonus command** -

		cat /etc/passwd | wc -l 
		wc stands for word count and -l is for number of lines

2. deleting user - 
	sudo userdel -r username. -r make sures home dir is also deleted 



3. set or change password - 

	- sudo passwd user for a different user
	- for the current user only passwd will suffice


4. creating a system user -
	sudo useradd -r username 