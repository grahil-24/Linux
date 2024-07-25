
provide metadata of a task. 

Eg: 
	- name: install updates (Amazon linux)
      tags: always
      dnf:
        update_only: yes
        update_cache: yes
      when: ansible_distribution == "Amazon"


tags: always means that this task should be always run. 


-> To list all the tags in a playbook, use the command - 
	ansible-playbook --list-tags {playbook_name}


-> to run plays against only specified tags: 
		 ansible-playbook --tags centos --become site.yml

		This will run the playbook only on tasks having centos as a tag


-> to target multiple tags - 
	ansible-playbook --tags "db,centos" --become site.yml