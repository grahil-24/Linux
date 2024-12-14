#!/bin/bash
jump_dir=/home/rahil

if [ -d $jump_dir ]
then
	echo "The directory exists"
	cd $jump_dir
	ls
else
	echo "The directory does not exist"
fi
