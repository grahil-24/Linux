
Stands for ssh file system and is used to mount remote directories locally. 

- allow users without root access to mount remote file system, without needing system wide access. 
- but the users still needs access to the remote server. 
- If the client is a trusted user on server, then a key is not needed. But if key is available then use the command - 
		sshfs -o IdentityFile=/home/rahil/Downloads/ec2.pem ec2-user@13.234.204.169:/home/ec2-user/documents remote_documents

- run the mount command and in the bottom we can see a fs mounted on our remote_documents directory. 
- For test, create a file on the server in the mounted FS. In the local machine, we observe that the file is present on the mounted directory. 
- to unmount a mounted directory use the umount directory. 
			Eg: umount remote_documents

- run the mount command and we observe that the mount is not listed. 
- we can also unmount directories, mounted using sshfs using a dedicated command - 
		fusermount -u {dir_name}


- ssh key is more preferred, as we can easily mount directories without entering a password everytime, when trying to ssh into the server. 
- to generate the ssh key - 
			ssh-keygen
- a key would be generated by the name of id_rsa in ~/.ssh/. BEAWARE!! ONLY GENERATE THE KEY IF id_rsa was not present before. 
- after generating the private and public key, copy the public file to the server using the command  - 

		ssh-copy-id -i ~/.ssh/id_rsa.pub {username}@{domain/ip-addr of server}

- if you have a pem file, like an ec2 instance, you can directly run the command - 
		ssh-add {path to key}
	and the next time you try to ssh into the server you wont need to specify your pem file or enter the password. 