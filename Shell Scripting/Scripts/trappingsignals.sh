#!/bin/bash
trap "echo 'trapped Ctrl-C'" SIGINT

echo "this is a test script"

count=1
while [ $count -le 5 ]
do
	echo "loop $count"
	sleep 1
	count=$[ $count + 1 ]
done
echo "end of script"
exit

