
DNF is a package manager. Helps us fetch softwares from remote repos and install dependencies and the software locally. 

Eg: sudo dnf install htop.

	this installs the htop package



-> If we dont know the exact name of the package we want to install, we can  use the command - 

	dnf search {package name}



-> to list all the installed packages - 

	dnf list installed



-> to view recently updated and installed packages use the command - 

	dnf list recent
	

-> to remove package

	sudo dnf remove {package name}


-> to update an installed package - 

	sudo dnf upgrade {package name}



-> to set up automatic updates with dnf-automatic


- sudo dnf install dnf-automatic

		- this will install the dnf-automatic package


- then sudo nano /etc/dnf/automatic.conf


-> reinstalling package with dnf - 


	sudo dnf reinstall {package name}


-> when removing packages, the dependencies are also removed, but sometimes they are not. To clean them up run the command - 

	sudo dnf autoremove.