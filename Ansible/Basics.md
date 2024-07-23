- ansible playbooks should be always present on git


=> Configuring target servers with ansible - 
	 1. Make sure openssh is installed on workstation and servers. 
	 2. Connect to each server from workstation, and answer yes to each prompt. 
	 3. create an ssh key pair for your normal user account. 
	 4. copy that key to each server
	 5. create another key specifically for ansible
	 6. copy that key to each server as well

=> Then we need to create an inventory file. The inventory file contains the ip address of each of the host servers that we want to manage with ansible. 
	- to test the connection - 
			ansible all --key-file ~/Downloads/ec2.pem -i inventory -m ping -u ec2-user

				--key-file - path to your public key 
				 -m stands for module. various modules out there, one of which is ping. 
				 -u is for remote user
				  -i specify the inventory file path 


=> We dont want to specify the key file path and inventory file path every time right? so we can create a config file for this purpose specifically. The name of the file is ansible.cfg. This same file is also present in /etc/ansinble directory. But we will prioritise this file. In this file, we will write the specific configuration - 

	[defaults]
	 inventory = inventory
	 private_key_file = ~/.ssh/ansible
	 remote_user = ec2-user

	-> Some basic and important commands - 
		1. ansible all --list-hosts 
			basically lists all the hosts

		2. ansible all -m gather_facts
				-gets detailed info about the host servers
				


		  3. ansible all -m gather_facts --limit {host_ip}

				- gets the info from only the host server specified. 

		