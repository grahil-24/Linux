
In this, we will see how to perform operations on remote servers, which require us to be root through ansible. 

	Eg: ansible all -m dnf -a update_cache=true --become --ask-become-pas

		- dnf is the default package manager for red hat based distros, centos and fedora. for debian based, apt can be used. 
		- update_cache is similar to sudo dnf update command. Updates the installed packages. 
		- --become is used to elevate privileges. By default it is sudo. 


	Eg: ansible all -m dnf -a name=vim --become --ask-become-pass
		- installs he vim  package. 



	Eg: ansible all -m dnf -a name="snapd state=latest" --become --ask-become-pass
		- installs the latest version of snapd, or if already installed, updates it to the latest version. 


