#!/bin/bash

read -p "enter y or n: " ANSWER

case "$ANSWER" in
	[yY]|[yY][eE][sS])
		echo "u answered yes."
		;;
	[nN]|[nN][oO])
		echo "u answered no."
		;;
	*)
		echo "invalid answer."
		;;
	esac
