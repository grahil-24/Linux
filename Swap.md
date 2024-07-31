
- Allocating virtual memory to our system 
- When our system runs out of memory, portions of memory allocated to idle processes are swapped to this swap partition 

-> Using a partition for swap space - 
	Suppose we have a partition /dev/sda1, which is to be used as swap 

	1. mkswap /dev/sda1 to initialize swap areas
	2. swapon /dev/sda1 will enable swap device
	3. to persist this swap partition, we need to add it to /etc/fstab file, sw will be the filesystem type
	4. to remove swap - swapoff /dev/sda1

