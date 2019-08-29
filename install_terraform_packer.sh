#!/bin/bash -xe
yum -y install unzip
which packer
if [ $? = 0 ]; then
    echo "packer already installed"
else
    curl -o p  https://releases.hashicorp.com/packer/1.4.2/packer_1.4.2_linux_amd64.zip
    unzip p
    mv packer /usr/bin
    rm -rf p
fi
which terraform
if [ $? = 0 ]; then
    echo "terraform already installed"
else
    curl -o t https://releases.hashicorp.com/terraform/0.12.6/terraform_0.12.6_linux_amd64.zip
    unzip t
    mv terraform /usr/bin
    rm -rf t
fi

#########################################################################################
yum -y install epel-release
yum -y update
yum -y install ansible byobu vim
