#!/bin/bash

factorial=1
for (( number = 1; number <= $1; number++ ))
do
	factorial=$[ $number * $factorial ]
done
echo "the factorial of $1 is $factorial"
