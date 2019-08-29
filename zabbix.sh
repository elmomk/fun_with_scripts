#!/bin/bash

rpm -ivh https://repo.zabbix.com/zabbix/4.2/rhel/7/x86_64/zabbix-release-4.2-1.el7.noarch.rpm
yum-config-manager --enable rhel-7-server-optional-rpms
yum -y install zabbix-agent
systemctl start zabbix-agent
systemctl enable zabbix-agent
echo "vi /etc/zabbix/zabbix_agentd.conf"
