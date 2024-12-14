#!/bin/bash
string1=soccer
string2=''

if [ -n $string1 ]
then
	echo "The string '$string1' is NOT empty"
else
	echo "The string is empty"
fi

if [ -z $string2 ]
then
	echo "The string is empty"
else
	echo "The string is not empty"
fi
