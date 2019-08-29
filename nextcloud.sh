#!/bin/bash
HOSTNAME=$1

hostnamectl set-hostname $HOSTNAME
yum -y update && yum -y install epel-release
yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
yum -y install yum-utils unzip curl wget bash-completion policycoreutils-python mlocate bzip2 setroubleshoot-server s3fs-fuse
yum-config-manager --enable remi-php73
yum -y install httpd php php-{imageick,ctype,iconv,libxml,openssl,posix,session,simplexml,xmlreader,xmlwriter,zlib,fileinfo,bz2,intl,,mysql,opcache,fpm,dom,mbstring,gd,pdo,json,xml,zip,curl,mcrypt,pear}
yum groupinstall mariadb-client -y
yum update -y
systemctl start httpd php-fpm
systemctl enable httpd php-fpm
cd /var/www/html
curl -o nextcloud-15-latest.tar.bz2 https://download.nextcloud.com/server/releases/nextcloud-15.0.7.tar.bz2
tar -xvjf nextcloud-15-latest.tar.bz2
rm -rf nextcloud-15-latest.tar.bz2
mkdir /opt/data
chown -R apache. /var/www/html/nextcloud/ /opt/data/
semanage fcontext -a -t httpd_sys_rw_content_t '/opt/data(/.*)?'
semanage fcontext -a -t httpd_sys_rw_content_t '/var/www/html/nextcloud/config(/.*)?'
semanage fcontext -a -t httpd_sys_rw_content_t '/var/www/html/nextcloud/apps(/.*)?'
semanage fcontext -a -t httpd_sys_rw_content_t '/var/www/html/nextcloud/.htaccess'
semanage fcontext -a -t httpd_sys_rw_content_t '/var/www/html/nextcloud/.user.ini'
restorecon -Rv '/var/www/html/nextcloud/'
restorecon -Rv '/opt/data/'
