#!/bin/bash
echo $SHELL

case $USER in 
	rich | rahil)
		echo "Welcome $USER"
		echo "Enjoy your stay";;
	barbara | rahil)
		echo "Hi there, $USER"
		echo "We are glad you could join us";;
	testing)
		echo "Please fuck off";;
	*)
		echo "Sorry not allowed";;
esac

