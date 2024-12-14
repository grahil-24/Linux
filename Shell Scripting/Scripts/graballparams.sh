#!/bin/bash

count=1
for param in "$@"
do
	echo "parameter $count is $param"
	count=$[ $count + 1]
done
exit

