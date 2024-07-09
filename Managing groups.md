

Every file is owned by a user and a group


-> groups command shows the groups the current user is a member of.

-> the groups info is present in /etc/group file. 



=> Creating a group 

	- sudo groupadd {groupname}

=> deleting a group

	- sudo groupdel {groupname}



=> There are 2 types of groups - 

	1. Primary groups - 
		- Write the command cat /etc/passwd and find a user. For eg: 
	ec2-user:x:1000:1000:EC2 Default User:/home/ec2-user:/bin/bash
	we can see the groupid and userid are 1000. Here the group id is for the primary group. 

	2. Secondary/Suplementary groups - 
		User is assigned a primary group. There is no difference between a primary and seconday group. Its all about how that group has been assigned. You cant create a primary or secondary group. Only groups.


=> Adding user to a group:

	sudo usermod -aG {group-name} {username}

		- -a is for appending
		- -G is for group

	- to change the primary group of a user - 
			sudo usermod -g {group-name} {username}


=> Group password -

	Equivalent of adding user to group using usermod - 
			sudo gpasswd -a {username} {groupname} 


