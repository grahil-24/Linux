
In the inventory file, we can create several groups and add servers to them. For eg: 

	[dbservers]
	13.126.58.81 
	
	[web_servers]
	3.111.144.225

	here web_servers and dbservers are two different group. A server can also be inside multiple groups.

In playbooks, just replace 
	hosts: all
		with 
	 hosts: {group_name}


