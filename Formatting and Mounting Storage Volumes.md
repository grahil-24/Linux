

sudo fdisk -l  - command shows info about storage devices.


1. To create a file system on a device run the command - 
		sudo fdisk /dev/sda


		- in the command prompt, type g, which will create a new gpt partition table. 
		- and then type n, which will create a new partition. 
		- after creating the partition, the changes have not been made yet. to make those changes type w in the command prompt, to write those changes 



2. Now we need to format the partition with the file system we want, using the command-
		sudo mkfs.ext4 /dev/sda1