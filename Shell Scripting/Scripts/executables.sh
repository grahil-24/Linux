#!/bin/bash

IFS.old=$IFS
IFS=:

for folder in $PATH
do
	for file in $folder/*
	do
		if [ -x $file ]
		then
			echo "$file is a executable"
		fi
	done
done
IFS=$IFS.old
