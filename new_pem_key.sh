#!/bin/bash
NAME_OF_NEW_KEY_PEM=$1

if [ $# != 1 ]; then
    echo "specify a name for your new key"
    exit 1
fi

ssh-keygen -t rsa -f $NAME_OF_NEW_KEY_PEM
