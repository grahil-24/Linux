#!/bin/bash
value1=10
value2=20
 
if [ $value1 -gt 5 ]
then
	echo "greater"
fi

if [ $value1 -eq $value2 ]
then
	echo "The values are equal"
else
	echo "The values are different"
fi
