#!/bin/bash

trap "echo 'Sorry... Ctrl-C is trapped'" SIGINT
count=1
while [ $count -le 3 ]
do
	echo "loop #$count"
	count=$[ $count + 1 ]
	sleep 1
done

trap -- SIGINT
echo "the trap is now removed"
count=1
while [ $count -le 3 ]
do
     echo "Second Loop #$count"
     sleep 1
     count=$[ $count + 1 ]
done
