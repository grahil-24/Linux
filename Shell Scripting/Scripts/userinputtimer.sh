#!/bin/bash

if read -t 5 -p "enter your name" name
then
	echo "hi $name"
else
	echo "sorry no longer waiting for name"
fi

