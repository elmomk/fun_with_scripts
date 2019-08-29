#!/bin/bash

yum -y update &&\
	yum -y install epel-release &&\
	yum -y update &&\
       	yum -y install byobu vim mariadb mariadb-server httpd yum-utils &&\
       	yum -y update
rpm -Uvh http://rpms.remirepo.net/enterprise/remi-release-7.rpmyum-config-manager –-enable remi-php72
yum -y install php72-php php72-php-gd php72-php-cli php72-php-mysqlnd php72-php-opcache php72-php-xml

### consider installing php-imap php-pear php-devel httpd-devel

php72 --version

systemctl start httpd
systemctl enable httpd
systemctl start mariadb
systemctl enable mariadb



### db for usequantum root   P%r>P&{rsk&skM3
### sed -i 's/utf8mb4_unicode_520_ci/utf8mb4_unicode_ci/g' your_sql_file.sql
