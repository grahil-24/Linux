

when we run the ls -l command we can see the directories and file in the current directory like this -

drwxr-xr-x. 3 root   root                17 Jun 19 10:42 amazon

the string "drwxr-xr-x" is the permission string, in which the first character denotes, whether it is a directory or a file. if its 'd' its a directory, '-' is for file and 'l' is for symbolic link


the other 9 characters are permissions for users and groups and so on. lets understand them - 

	1. the first three characters - rwx
		- indicates permissions for user which owns this file or folder. in this example root is the owner 		of the directory.
		- r is for read,w for write and x is for execute.
	2. the 2nd set is for group which owns the file or directory
	3. the 3rd set is everybody else other than the user and group which owns that object


-> Changing permissions of file or directories - 

	1. chmod +x testfile.txt

		-adds x permission for EVERYONE
	2. chmod -x testfile.txt
		-removes x permission for EVERYONE!!
	
	3. chmod u-x testfile.txt
		-removes x bit only from the user
	
	4. g is for group like chmod g+x testfile.txt and o is for others


-> Lets try changing permissions for every file inside a directory to 600. We can use the command - 

	chmod -R 600 Downloads. But this is not good. -R is for recursive. Even though, every file will have 600 	as permission, so will the Downloads directory, and 600 means we dont have execute permission, so we cant 	ever cd or change to Downloads directory. We can do this using the find command		

-> Changing the ownership of an object

	sudo chown -R Morpheus Pictures/

	Morpheus now owns the Pictures directory. But the group remains the same. To change the group use the command - 

	sudo chown -R morpheus:morpheus Pictures