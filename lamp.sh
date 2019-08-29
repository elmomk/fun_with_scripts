#!/bin/bash

PHP="remi-php73"
DATABASE="mariadb" ### or mariadb-client

yum -y update && yum -y install epel-release
yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
yum -y install yum-utils unzip curl wget bash-completion policycoreutils-python mlocate bzip2 setroubleshoot-server s3fs-fuse
yum-config-manager --enable $PHP
yum -y install httpd php php-{imap,pear,devel,mysqlnd,imageick,ctype,iconv,libxml,openssl,posix,session,simplexml,xmlreader,xmlwriter,zlib,fileinfo,bz2,intl,,mysql,opcache,fpm,dom,mbstring,gd,pdo,json,xml,zip,curl,mcrypt,pear} 
yum groupinstall $DATABASE -y
yum update -y
systemctl start httpd php-fpm $DATABASE
systemctl enable httpd php-fpm $DATABASE

# Install composer
curl -sS https://getcomposer.org/installer | \
    php -- --install-dir=/usr/bin/ --filename=composer

