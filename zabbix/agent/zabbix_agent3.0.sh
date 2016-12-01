#!/bin/bash


ipad="project_name-x.x.x.x"
useradd zabbix -s /sbin/nologin
wget http://repo.zabbix.com/zabbix/3.0/ubuntu/pool/main/z/zabbix/zabbix-agent_3.0.0-1+trusty_amd64.deb
dpkg -i zabbix-agent_3.0.0-1+trusty_amd64.deb
apt-get -f install

sed -i 's/^ServerActive=.*/ServerActive=x.x.x.x:10051/' /etc/zabbix/zabbix_agentd.conf
sed -i "s/^Hostname=.*/Hostname=${ipad}/" /etc/zabbix/zabbix_agentd.conf
sed -i 's/^Server=.*/Server=x.x.x.x/' /etc/zabbix/zabbix_agentd.conf
sed -i "s/^ListenIP=.*/#ListenIP=/" /etc/zabbix/zabbix_agentd.conf
sed -i 's/^ListenPort=.*/#ListenPort=/' /etc/zabbix/zabbix_agentd.conf

/etc/init.d/zabbix-agent restart

sed -i '13i /etc/init.d/zabbix-agent start ' /etc/rc.local
