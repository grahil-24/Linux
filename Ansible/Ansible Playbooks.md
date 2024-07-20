
their default format is yaml. It is sort of a script, like dockerfile, telling ansible about configuration changes to be made on the host servers. Simple eg of installing httpd/apache2 on remote servers - 

 create a file named - install_apache.yml -

		  --- 

		  - hosts: all
		    become: true
		    tasks: 
			    -name: install httpd package
				 dnf: 
					 name: httpd
					 state: latest


->  Ansible will always gather facts about the host servers before running the playbook. 

=> Understanding the output- 
	1. Unreachable - if the server was offline, this would be 1
	2. skipped - if we had some conditional task, ie run this task if some requirements are not met or else skip it. 
	3. rescue - run a task as rescue if some previous task had failed. 
	4. failed - if the task failed to run on the host server. Eg: if the package did not exist in repo. 


-> We can also remove packages: 
	- just change the state from latest to absent
	