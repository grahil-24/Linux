
- / - The root directory of the entire filesystem hierarchy, everything is nestled under this directory.
- /bin - Essential ready-to-run programs (binaries), includes the most basic commands such as ls and cp.
- /boot - Contains kernel boot loader files.
- /dev - Device files, where linux creates device nodes. 
- /etc - Core system configuration directory, should hold only configuration files and not any binaries.
- /home - Personal directories for users, holds your documents, files, settings, etc.
- /lib - Holds library files that binaries can use.
- /media - Used as an attachment point for removable media like USB drives.
- /mnt - Temporarily mounted filesystems.
- /opt - Optional application software packages.
- /proc - Information about currently running processes.
- /root - The root user's home directory.
- /run - Information about the running system since the last boot.
- /sbin - Contains essential system binaries, usually can only be ran by root.
- /srv - Site-specific data which are served by the system, also where local services store their files.
- /tmp - Storage for temporary files
- /usr - This is unfortunately named, most often it does not contain user files in the sense of a home folder. This is meant for user installed software and utilities, however that is not to say you can't add personal directories in there. Inside this directory are sub-directories for /usr/bin, /usr/local, etc.
- /var - Variable directory, it's used for system logging, user tracking, caches, etc. Basically anything that is subject to change all the time.


=> Journaling - 
	In a journaled system, before your machine even begins to copy the file, it will write what you're going to be doing in a log file (journal). Now when you actually copy the file, once it completes, the journal marks that task as complete. The filesystem is always in a consistent state because of this, so it will know exactly where you left off if your machine shutdown suddenly. This also decreases the boot time because instead of checking the entire filesystem it just looks at your journal

=> Different types of file systems -
1. Ext4 - native linux FS. latest version. It supports disk volumes up to 1 exabyte and file sizes up to 16 terabytes and much more. It is the standard choice for Linux filesystems. 
2. btrfs  - better/butter file system. it is a new filesystem for Linux that comes with snapshots, incremental backups, performance increase and much more. It is widely available, but not quite stable and compatible yet.
3. XFS - high performace journaling file system. Great for a system with large files like media servers
4. FAT/NTFS - windows file system. NTFS is the current default fs for windows. FAT is still used by usbs, drives which are to be used by windows and other OSes.
5. HFS+ - macintosh file system



df -T

	The **df** command reports file system disk space usage and other details about your disk,


<h4>Anatomy of a disk:</h4>
- Hard disks can be divided into partitions, essentially making multiple block devices eg: /dev/sda1, /dev/sda2 are partitions of the disk /dev/sda. 
- Partitions are extremely useful for separating data or if you need a certain filesystem.

-> Partition table - 
- This table tells where a partition begins and ends, which partition is bootable and which sectors of the disk have been allocated to which partition. Two main partition table schemes used - MBR(Master Boot Record) and GPT(GUID Partition Table)

-> Partition - 
- If a space on disk is not allocated to any partition, it is known as free space
- Inside a partition, a filesystem can be present or other things like swap 

	1. MBR - 
		i. Three types of partitions - primary, extended and logical. 
		ii. Max upto 4 primary partitions
		iii. Additional partitions can be created by making a primary partition into an extended partition. Then inside the extended, we can create multiple logical partitions. 
		iv. There can only be one extended partition on a disk. 


	2. GPT - GUID(Globally unique ID) Partition Table
		i. Has only one type of partition, and many of them can be created
		ii. Each partition has a globally unique ID (GUID)
		iii. Used mostly in conjunction with UEFI based booting.  


=> Filesystem structure - 

1. Boot block - This is located in the first few sectors of the file system. It contains info to boot the OS. 
2. Super block - Comes after the boot block. It is a single block and contains info about the file system, size of fs, size of inode, size of logical blocks etc. 
3. Inode table - 
4. Data blocks - actual data for files and directories. 


<h4> Disk Partitioning: </h4>
Many tools available to partition a disk - 
	1. parted, gparted - both GPT and MBR
	2. fdisk - does not support GPT
	3. gdisk - fdisk, but only supports GPT

-> Using parted - 
		1. Launch parted using - sudo parted
		2. select device you want to partition using 
				select {device_name}
				Eg: select /dev/sda1
		3. to partition the device - 
				mkpart primary 123(starting sector) 4567(ending sector)


<h5>Creating a file system:</h5>
	eg: sudo mkfs -t ext4 /dev/sda1

			mkfs - make filesystem, allows us to create a type of filesystem in a partition of our choosing.


<h5>Mounting and unmounting</h5>
	We have to mount a file system, before we can view the contents inside it. For this we need to know two things - the file system type and the mount point 


		- Mount point is a directory on our system where the filesystem is going to be attached 

	Eg: 
		sudo mount -t ext4 /dev/sda1 /mydrive


- to unmount - 
		sudo umount /mydrive
		or 
		sudo umount /dev/sda1

- Kernel also generates a unique UUID (universally unique ID) for the device. If the name of the device changes, it doesnt matter, the UUID remains the same. To know the UUID of all block devices - 
			sudo blkid

<h5>Inodes: </h5>
Index node. Entry table. Contains entry for every file in the filesystem. 

- File type - regular file, directory, character device, etc
- Owner
- Group
- Access permissions
- Timestamps - mtime (time of last file modification), ctime (time of last attribute change), atime (time of last access)
- Number of hardlinks to the file
- Size of the file
- Number of blocks allocated to the file
- Pointers to the data blocks of the file - most important!

Basically inodes store everything about the file, except the filename and the file itself!

-> When are inodes created? 

	