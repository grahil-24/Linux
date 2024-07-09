
Public key authentication - 

	-> about openssh/ssh - 
		- when using ssh try not to use password authentication
		
		1. Generating an ssh keypair
			make sure the .ssh folder is empty before generating a key. If not empty then back them up.
			- use the command = "ssh-keygen -b 4096". -b denotes number of bits. 4096 is weaker than the default one. 
		
		2. Copy the public key to over the server, we want to connect to
			ssh-copy-id username@ipaddr
		

		3.When we copy the pub key to server, it is stored in the authorized_keys file present in ~/.ssh/authorized_keys