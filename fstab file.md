	stands for file system table. is a configuration table designed to ease the burden of mounting and unmounting file systems to a machine.

- present in /etc directory
- useful in mounting partitions


1. use the command lsblk to list all block devices. In my case the usb was named sda 
2. run the command mount | grep sda to show where this drive was mounted in our file system. 
3. There are many directories where people prefer to mount their storage. These are - 
	1. /mnt
	2. /media - this is more preferable for temporary storage.
4. Now we want to edit the /etc/fstab file and append the following line - 

	/dev/sda1 (source)  /mnt/mydisk(where we want to mount it) ext4(file system tye) defaults(options) 0(dump. always 0)   0(pass. priority of file system check. 0 means it will not be checked).

5. Now run the command sudo mount /mnt/mydisk to mount our storage. 
6. A better way to mount is to use UUID instead of /dev/sda1, because if you disconnect it and plug it again in same or different ports, this file name may change to sdb or sdc. So UUID is used. To get the UUID, type the command 
		lsblk -l or blkid

7. Usually use the options defaults,ro,noauto.  What ro does is - read only mode and noauto is that with the command mount -a, it wont mount. You have to manually mount it using mount /mnt/mydisk.