When connecting a device to your machine, it generally needs a device driver to function properly. You can interact with device drivers through device files or device nodes, these are special files that look like regular files. Since these device files are just like regular files, you can use programs such as ls, cat, etc to interact with them. These device files are generally stored in the /dev directory.


=> Device types : 
1. c - character
2. b - block 
3. p - pipe
4. s - socket

1. Character device - These devices transfer data, but one character at a time. These arent physically connected to the machine
2. Block Device - transfer data, but in larger fixed sized blocks. Eg: filesystems, hardrives etc. 
3. Pipe device - allow two or more process to communicate with each other. 
4. Socket device - Facilitate communication between processes similar to pipe. But they can communicate with many processes at once. 

=> Device characterisation - Devices are characterized using two numbers, **major device number** and **minor device number**. You can see these numbers in the above ls example, they are separated by a comma. For example, let's say a device had the device numbers: **8, 0**.  The major device number represents the device driver that is used, in this case 8, which is often the major number for sd block devices. The minor number tells the kernel which unique device it is in this driver class, in this case 0 is used to represent the first device (a). 

=> Device Names: 

1. SCSI - Small Computer System Interface protocol. Usually for communication of printers, drives,scanners and other peripherals  with the kernel. Pronounced ("scuzzy").
		Common SCSI device files - 
			1. /dev/sda - naming for SCSI device usually starts from a, b ...z 
			2. /dev/sdb - 
			3. /dev /sda3 - 3rd partition for the sda device. 


2.  Pseudo device - not physically connected to the machine. Usually character devices.
		Eg: 1. /dev/zero - discards the input and produces a continuous stream of null bytes. 
			2. /dev/null - discards the input  and output 
			3. /dev/random - produces a random number




=> dd - 
	tool to convert data or copy over data from one file to another. 
			Eg; 
				dd if={input_file} of={output_file} bs={bytes size} count={num_of_blocks_to_copy}
				- bs option is in bytes.  