#!/bin/bash

count=1
cat $HOME/pig_1711018739651.log | while read line
do
	echo "line $count: $line"
	count=$[ $count + 1 ]
done

