#!/bin/bash
NAME_OF_NEW_KEY_PEM=$1

if [ $# != 1 ]; then
    echo "specify a name for your new key"
    exit 1
fi

ssh-keygen -P "" -b 4096 -t rsa -f ~/.ssh/$NAME_OF_NEW_KEY_PEM

ls ~/.ssh
echo done
