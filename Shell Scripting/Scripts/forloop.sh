#!/bin/bash

echo $SHELL
list="Ahmedabad Rajkot Surat"
list=$list" Mumbai"
IFS=$'\n'

for city in $( cat city )
do
	echo "Welcome to $city"
done

