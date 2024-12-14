#!/bin/bash

echo 
echo "using the shift method:"
count=1
while [ -n "$1" ]
do
	echo "parameter $count is $1"
	count=$[ $count + 1 ]
	shift
done
exit
	
