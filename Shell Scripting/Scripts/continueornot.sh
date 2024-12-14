#!/bin/bash

read -n 1 -p "Do you want to continue [Y/n]? " answer

case $answer in 
	Y | y) echo
		echo "ok continue on...";;
	N | n) echo
		echo "ok exiting..."
		exit;;
esac

