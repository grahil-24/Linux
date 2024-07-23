
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


=> When conditionals : 

		what if some of our servers were Red hat based and some debian, we cant run tasks having dnf on both of them right? This is where when conditionals comes in 

		  --- 

		  - hosts: all
		    become: true
		    tasks: 
			    -name: install httpd package
				 dnf: 
					 name: httpd
					 state: latest
				 when: ansible_distribution == "Fedora"

	- This runs the task only when the server is fedora based.  We can also provide multiple distriubtion. Eg: 

		when: ansible_distribution in ["Amazon", "RedHat",  "CentOS", "Fedora"]



-> we can have many arguments in when. Just use the gather_facts command to get info of server(s) against which we can use conditional stmts. 



=> Improving your playbook - 
	1. If you want to install more than one package. We dont need to create seperate tasks for both of them. Both can be done in one. for eg: 

			tasks: 
				-name: installing httpd and php package
				dnf:
					name: 
						-httpd
						 -php
					 state: latest


	2. Variables in anisble - 
			to use variables, we need to add them in inventory file 


			[dbservers]
			13.126.58.81 ansible_ssh_user=ec2-user apache_package=httpd php_package=php
			3.111.144.225 ansible_ssh_user=ec2-user 


			 - hosts: all
			  become: true
	  tasks:

    - name: install httpd and php package and update repository index
      dnf:
        name: 
          - "{{apache_package}}"
          - "{{php_package}}"
        state: latest
        update_cache: yes
      when: ansible_distribution in ["CentOS", "Amazon", "Fedora", "RedHat"]


3. Replace dnf with package: If we keep it dnf, it will fail on servers, which do not have dnf as their package manager. "package" is the generic ansible package manager. Ansible automatically sets it to the server's package manager, and hence task can run on almost any server irrespective of the package manager. 

	Eg: 

		- name: install httpd and php package and update repository index
	      package:
	        name: 
	          - "{{apache_package}}"
	          - "{{php_package}}"
	        state: latest
	        update_cache: yes
