#!/bin/bash

for obj in /home/rahil/*
do
	if [ -d "$obj" ]
	then
		echo "$obj is a directory"
	else
		echo "$obj is a file"
	fi
done > output.txt
	
