#!/bin/bash -xe

yum -y install samba-client cifs-utils
smbclient -L  \\sambaserver
smbclient  \\sambaserver\path\to\folder -U user
mkdir  /usr/local/var/www/upload
mount -t cifs -o username=user,domain=,password=bla,sec=ntlmssp,vers=3.0 \\sambaserver\path\to\folder /usr/local/nginx/html/www/upload
echo " \\sambaserver\path\to\folder /usr/local/nginx/html/www/upload cifs multiuser,sec=ntlmssp,username=user,password=,domain=,vers=3.0 0 0" >> /etc/fstab

## sanity check
ll /usr/local/nginx/html/www/upload
df -hT
