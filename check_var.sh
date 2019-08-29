#!/bin/bash

if [ -z $1 ] && [ -z $2 ]; then
	echo empty
	exit 1
else
	echo "not empty"
fi

echo "check last"
