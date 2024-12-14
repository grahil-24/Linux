#!/bin/bash

if [ -n "$1" ]
then
	factorial=1
	for(( num=$1; num >= 1; num-- ))
	do
		factorial=$[ $factorial * $num ]
	done
	echo "the factorial of $1 is $factorial"
else
	echo "no param was passed"
fi

