
Link one file to another in linux.  Symoblic links are also referred to as soft links

when we use the command ls -i, we see the listing of objects with some number on left side. That number is called inode number. Inodes are objects which store metadata of files. 


Two types of links - 
	1. Symbolic links
	2. Hard links


command to create a symbolic link - 

	ln -s {source path} {destination path}


Inode numbers of file and the file linked to it are different as both are different objects. 


Symbolic links can cross different file systems whereas hard links cannot.


--Hard Link---

To create a hard link, simply remove the -s option

We observe that both hardlinked file and original file have the same inode number. Both are the same objects.








