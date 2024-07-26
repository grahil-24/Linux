
1. usermod
		To modify a user. that is add a user to a group etc. 

- sudo usermod -aG admins jay      -> this adds jay user to admins group

- sudo usermod -d /home/myhome --move-home jay
   
			   creates a home directory for user jay and moves its current home  directory to the newly created one which is /myhome

- sudo usermod -l newname oldname

	renames the user

-  sudo usermod -L username

		locks out the user. To unlock user use -U flag instead of -L



2. Sudo 
		- /etc/sudoers file shows info about sudo and shows which group is used for sudo, in some distros it is wheel and in some sudo. 


	  - groups username
			shows which groups the user belongs to 

	  - sudo -l 
			shows what permissions the current user has

	 - sudo !! 

			reruns the previous command with sudo privileges


	- In sudoers file we observe that - 
				- root       ALL=(ALL:ALL) ALL
				- in sudoers file we can mention what privileges do users have for what users and groups and what commands they can run with sudo 




3. Htop 

		- sigterm(15) - cleanly kills a process. 
		- sigkill(9) - forcefully kills a process. Always do sigterm first. if   the process does not respond then do sigkill.



4. ps 

		- shows running processes of the current session by default
		- tty shows the terminal inside which the process is running inside of 

	- ps -aux

	 - ps -He 
			- shows processes in a hierarchical manner



			- ppid - pid of parent process
			- sid - session id
			- pgid - parent group process id
			- tpgid - terminal id associated with the process
			- uid - userid that started the process. 0 is the root



5. awk - Its command and also a sort of a scripting language.

	We can use awk to create filters. To accept data via stdin, change it or modify it and send it back via stdout. 

		Eg:	 awk '{print}' tmnt.txt
			- prints the content of the file tmnt.txt

				awk '{print $1}' tmnt.txt
			- prints the first field of the file tmnt.txt

	Spaces are the delimiter by default.

	We can also use it in a pipeline to select only particular fields. For eg: 

		ls -l | awk '{print $1 $9}'

		selects the first and 9th field from the output of command ls -l.

	
	Eg: awk '{print $NF}' tmnt.txt

		NF is number of fields. This will grab the last field.


To use  a custom delimited we can use the -f option. 

		Eg: awk -F ':' {print $1} /etc/passwd






6. sed - 

stream editor. to filter and modify text in usually textfiles. 

eg: sed 's/Pineapple/Feta/' toppings.txt


replaces every occurence of pineapple with feta in the file but does not actually modify the file. 


We can make changes by adding an -i option like - 

	 sed -i 's/Pineapple/Feta/' toppings.txt




7. Systemctl - 

		- sudo systemctl status {service-name}
				shows the status and logs of the service


	     - sudo systemctl stop {service}
	     - systemctl list-unit-files --type=service
				lists all the unit files and shows their status


		- systemctl restart service
		- systemctl reload service

			difference between restart and reload -
				When we change a service configuration, we dont need to restart service everytime. Reload works most of the time. Reload makes this changing without turning off the service. 



			- all the service configuration files are present in /usr/lib/systemd/system





8. Find 


	 1. find /home/rahil/Documents/ -name '*.txt' | grep -v .cache
		- find all files in /home/rahil/Documents dir which end with .txt but must not be in .cache directory. 



	2. find . -name Documents -type f
		 - find all files present in pwd with name Documents. 
		 - to find only directories use -type d


		** Notes - To read a file you dont need execution permission, but to enter a directory you do need the execution permission. 


	chmod -R u+x Pictures/

	- add execute permissions to existing permissions for the current user.


9. grep

- global regular expression print
- used to search for texts within a file


	Eg:  cat /etc/ssh/ssh_config | grep Port
		this will return the line which contains the word Port. As grep can also search through files, we dont need cat. So this command can be rewritten as - 
			grep Port /etc/ssh/ssh_config


	Eg:  cat /etc/ssh/ssh_config | grep -v Port
		this will return all lines which DO NOT contain the word Port


	Eg: grep -n Port /etc/ssh/ssh_config
			with the help of -n option, it also returns the line number. To get the count ie how many times that word was present in the file, we can use the c option


	Eg: to make search case insensitive, use the -i option like this - 
		grep -i port /etc/ssh/ssh_config


	Eg: To search recursively use the -r option. 

	

10. echo- 

	showing text and content of variables on terminal

	
	Eg: echo -e "This is a\blinux server"

		\b means backspace. So a will not be printed, when we execute this command

	Eg: echo -e "This is a Linux\cserver"
		\c will truncate anything that comes after it

	Eg: echo -e "This is \na linux server"
		\n is for new line

	
	-> Echo can also be used to redirect output to a text file 
	

		Eg: echo "redirecting to a file" > log.txt



11. Bash History - 


	history command shows previously used commands 
		
		when we run the history command we see its number and the command. To run that command we can use the command - 
			!num_of_command
	
	
		-> To also view the time and date at which the command was run, we need to modify the .bashrc file
		and add this following two lines to it - 
			
			#this ignores commands which start with space. this can be used when we want to enter password in 
			plaintext in command. So we dont want to show them up in history
			HISTCONTROL=ignoreboth
			HISTTIMEFORMAT="%Y-%m-%d %T "
		
	
		-> to view only last n commands use this - 
			history n
	
		
	
		-> we can also press cltr + r to search for previously used commands



12.  Ping - 

		To check if a server is online or not. We send an echo request to a server, and if the server is online, it will respond with an echo response, indicating that it is online. 

		->To send a ping request use this command - 

				ping 8.8.8.8

				- 8.8.8.8 is ip for google's DNS server. It is mostly used to   test our internet connection. 

		->  Instead of using ip address, we can also use domain name -
				ping www.youtube.com


		ICMP - internet control message protocol. This protocol is used by ping to send request to the server


		-> To control, how many times we send ping request and then exit automatically, we can use the command - 


			ping -c 6 ip_addr

		-> Ping can be used to troubleshoot. When we ping and see that the dropped packets are too much, that means there can be some problem with the network connection. But it is not the final and only troubleshooting utility. It is just the starting point. 


		-> ping can be used to find out when the server was online- 

				ping ipaddr/hostname 


			when the server is online, we get response. But when it goes offline, the responses stop, but the command does not exit. When the server comes back online, we start getting the responses. 




13. wget  - to download something from internet to our server without a GUI


		to download something using wget just use the command - 
				- wget {download_url}

		to download and rename the file, use the command - 
				- wget -O {custom_name} {download_url}


		to choose the location for downloading file - 
				- wget -P /home/rahil/Downloads {download_url}
				- now the file will be downloaded to the ~/Downloads path


		to resume an interrupted download- 
				- wget -c {download_url}




14. df and du commands - 


	1. df - stands for disk free. It shows how much space is left in our storage devices. 

			-h makes the output human readable
			-T also shows the type of file system for the different storage devices

		Eg: df -hT -x tmpfs 
			This commands shows types and human readable format and excludes tmpfs file systems. 


	2. To know whats occupying what size in a folder in our file system we can use the du command. Eg: 
				du {path}
				du /home/rahil

			- But what this command does is, it shows the output for EVERY file and folder in the target directory. If the target directory is pretty big, we might get flooded with lines and lines of output in our terminal. 


		- du -h --max-depth 1 /home/rahil
				- max-depth controls how many directories deep du command is allowed to go 



		- -s option gives summary

		- we can also scan through multiple target directories at once 
				Eg: sudo du -hs /home/rahil /etc


		- -c option gives us the total in the end


		**NOTE**: a good alternative of du is ncdu



15. tar and gzip

		tar is used to create archives. It helps to bundle different files into an archive. Similar to zip file. Difference is an archive isnt compressed. Though there is a way to compress a tar file


		Eg: tar -cf {tar file name to be created} {folder to be archived}
			-c means we want to create a new archive


	 - to view the contents of tar without extracting it, we can use the command - 

			tar -tf xen_ss_tar.tar


		to view the contents in verbose mode, we use the -v option 
				tar -tvf xen_ss_tar.tar


	-> to extract an archive file - 

		tar -xvf {tar_file_name}



	Compressing a file with gzip - 

		gzip {file name}


	Uncompressing a file with gunzip

		gunzip {zipped file name}



		**Note** : tar -czf  etc_backup.tar.gz etc. This will first gzip and then tar



16. cat 

		stands for concatenate. show contents of textfile on the terminal 

		Eg: cat {file_name}

		- We can also see contents of more than one file

		 Eg: cat {file_name1} {file_name2}

		- copy contents of file into another file

		Eg: cat {file_name1} {file_name2} > combined.txt

		Eg: cat -n {file_name}
			shows output with line numbers.


	- can also be chained with a grep command. Eg: cat {file_name} | grep cats


17. diff - 

		diff file1.txt file2.txt
			- if theres no output, means there are no difference. We can check the exit code, to see if there was no error returned using echo $?
			-if theres a difference it may look like this - 


				![[Pasted image 20240702114131.png]]
		Lets see what 15c15 means - The first 15 indicates the first file and the second indicates the second file. 

		 Means the difference is present at line 15 in both the files. In order to make the files same, line 15 in both files have to be changed. c means changed. If 15a15 was present, means something must be added to make both of them the same. If 15d15 was present, it means delete. 


	- To have a colourised output, we need to install a special package called colordiff. 

	- If we need more details, we can use -u option with diff. 


18. locate - 

	locate command has a database, in which we can search files for files without specifying a path. In its database, folders and files from throughout the filesystem are present. 

		Eg: locate sshd_config


	 We need to update the database once in a while, when we update, remove or install anything. This can be done using the command - 
				sudo updatedb



	- to use case insensitive mode, use -i option
	- locate *.conf  - finds files in its database ending with .conf

	 -  locate -n 4 *.conf

			- limits output to 4 lines


19. Commands for inspecting hardware - 


		1. lsusb - lists all the usb devices.
				Combine with watch command to see if the usb device was detected or not. Watch runs the command every 2 seconds. 
				To view a treeview with lsusb ,use the -t option
		2. lspci - lists devices on pci bus.
		3. lshw - lists almost all hardware information of server/machine, This command should be run as super user/sudo. To shorten the output, use the option -short
		4. lscpu- shows information about your cpu.  
		5. lsblk - to list block storages. 



20. rsync - transfer files from one linux server to another. rsync has more options than scp. both use ssh to transfer files. 


	rsync -v --dry-run unnamed.jpg ec2-user@43.205.240.250:/home/ec2-user/backup

		--dry-run is used to test the execution before actually doing it. always do a dry run first when using rsync. -v option is for verbose. 



21. top - 

		shows statistics about cpu, memory usage. Lists processes running, how much resource they are utilizing etc. We can also kill processes, by pressing k and then entering the Process Id. 


- If we want to change delay then press d and enter time interval. Delay means after how much time the information will be updated. 


- Things u should look out for - 
		1. cpu usage - very high and very low, both are a problem. 
		2. swap - isnt being overly utilized. 


22. lsof - **ify group ownership**
		list open files. 
		Eg: lsof | head
				PID - process ID 
				TID - thread identifier
				TASKCMD - usually same as COMMAND
				USER - shows file was opened by which user
				TYPE - shows the type of file - is it a dir, binary file, text file, executable etc. 
				NODE - shows inode number. inode stores metadata of files like permissions, size etc. 
				NAME - name of the object


	output is different when sudo is used. 


	- to filter by user without grep, we can use built it option - 
				lsof -u {username}

	- to list all files opened by processid parameter -p option is used, or -c if process name is to be used. 
			Eg: lsof -p {process_id} or lsof -c {process_name}

	 -  to exclude only root user from output
			Eg: lsof -u ^root 

	- to see only files open in a certain directory - 
			Eg: lsof {path}


	- to view ipv4 address connected to the opened files - 
			eG: lsof -i 4 /mnt


22. cut - remove sections from each line of files

		Eg: cut -b 1 {file_name}  - prints only the 1st character of each line of the file  

		Eg: cut -b 7-11 {file_name} - range of characters. shows the 7 to 11th characters for each line in the file. -b is for

		Eg: -b is for bytes, while -c is for characters. though most of the times, it gives the same output as 1c = 1b. 


			- We can also select specified fields by specifying a delimiter. 
				Eg: cut -d " " -f 1,2 {file_name}



		Eg: cut -d ":" -f 1 /etc/passwd - this will only grab the usernames from each line



23. tr - translate or delete characters. 


	Eg: echo "Hello world" | tr [a-z]  [A-Z]
		- output is now all capitalized. 
		- all lowercase will be replaced by uppercase


- to delete characters using tr - 

		Eg: echo "Hello world" | tr -d [a-zA-Z]
			- -d option tells tr to delete something
			- this deletes every character from a-z and A-Z. so the output will be empty. 

		Eg: echo "rahil@localhost" | tr -s t
			- -s option stands for squeeze and is used to "squeeze" out duplicates. In this case duplicated 't' are removed.


- to delete every alphabets - 
		tr -d [:alpha:]



- to replace a character - 
			Eg: cat message.txt | tr "!" "."

 

24. man- 

	read manual pages for various commands. After entering man page. You can search for something by pressing / and then typing what you want to search for and pressing enter. 


	pressing g lets us go to the top of man page and G for bottom of the man page. 

- There are different sections in man pages for different use case - 


		![[Pasted image 20240709103836.png]]


  to view a particular section use the command - man {section_number} {command}
		Eg: man 2 ls



25. Watch  - Executes a command every 2 seconds. Eg:  watch ls
		Executes the ls command every 2 seconds. A good example is - watch free -m 
		which updates and displays the amount of memory free every 2 seconds. 

		Eg: watch -d free -m 
				-d option highlights anything that changes. 

	 - We can change after how much time the command will be rerun by using the -n option. Eg: watch -d -n 0.5 free -m. This will execute the free -m command every 0.5 seconds. 


	-> Watch with a command which contains pipeline or redirects - 
			watch ls -lh | grep leetcode
		- this wont actually run. 
		- To execute a command like this successfully, wrap the command which we want to run every two seconds in ''. Eg: 
			watch 'ls -lh | grep leetcode'


26. Head and Tail - Head shows the first 10 lines and tail the last 10 lines by default. 

		Eg: head {path_to_file}

	 to view some other number of lines other than 10, we can use the -n option 
	 Eg: head -n 25 /var/log/syslog


	-> tail command has an option -f, which is specific to the tail command. 

			Eg: tail -f /var/log/boot.log
			-f is for follow. After execution, it does not return to the session. When the file gets updated, tail displays the updated content. 



26  umask : 
	defines the default permissions a newly created file would have. 
		Eg: umask 022 (which is the default in almost all the distros)
		- this digits denote the permissions to be excluded and not included as in chmod -command



27. sticky bit - 

		depicted by t. means only the owner or root can delete the file or dir. To add this to a file or dir - 


	Eg: sudo chmod +t {obj}

- numerical representation of sticky bit - 1
- 
