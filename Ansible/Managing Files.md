- name: copy default html file for site
      tags: apache, apache2, httpd
      copy: 
        src: default_site.html
        dest: /var/www/html/index.html
        owner: root
        group: root
        mode: 0644


- mode - permission
- dest: destination path. File name not be same as source file
- src: source path


-> Next, we will see, how to download and install terraform on target servers:


	 hosts: [web_servers]
	  become: true
	  tasks:
	    - name: install unzip
	      package:
	        name: unzip
	
	    - name: install terraform
	      unarchive:
	        src: https://releases.hashicorp.com/terraform/1.9.3/terraform_1.9.3_linux_amd64.zip
	        dest: /usr/local/bin
	        remote_src: yes
	        mode: 0755


- the unarchive module is used to unzip a zip or compressed file to the destination path which is /usr/local/bin (its a common directories where binaries are stored)
- remote_src: indicates that the file is not present in the local machine, from where the playbook is executed. The file is to be downloaded from a remote server. 


=> To edit a file - 
	- name: change e-mail address for admin
  tags: apache,amazon,httpd
  lineinfile: 
	path: /etc/httpd/conf/httpd.conf
	regexp: '^ServerAdmin'
	line: ServerAdmin somebody@somewhere.net
  when: ansible_distribution == "Amazon"

 - name: restart httpd
  tags: apache, centos, httpd
  service: 
	name: httpd
	state: restarted
  when: httpd.changed



	- edits the file present at path. 
	- fetches the line which matches the regex and replaces it with the line parameter
	- restart httpd task restarts httpd service when it is changed