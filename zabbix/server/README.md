#### Zabbix Server 搭建说明
---
#### 1.版本说明
	zabbix-server 3.0.0

#### 2.源码编译安装
```
apt-get install -y  libxml2-dev  libcurl4-openssl-dev libsnmp-dev snmp
./configure --prefix=/usr/local/zabbix-3.0.0 --enable-server --enable-agent --with-mysql --with-net-snmp --with-libcurl --with-libxml2
make && make install

cd /root/zabbix-3.0.0/database/mysql

mysql -uroot -p'password' -h127.0.0.1 -P3306
create database zabbix default character set utf8;
mysql -uroot -P3306 -h127.0.0.1 -p zabbix < schema.sql
mysql -uroot -P3306 -h127.0.0.1 -p zabbix < images.sql
mysql -uroot -P3306 -h127.0.0.1 -p zabbix < data.sql 

ln -s /usr/local/zabbix-3.0.0/bin/* /usr/bin/
ln -s /usr/local/zabbix-3.0.0/bin/* /usr/sbin/
cp /root/zabbix-server /etc/init.d/
vim /etc/init.d/zabbix-server	#修改为如下
DAEMON=/usr/local/zabbix-3.0.0/sbin/${NAME}

chmod +x /etc/init.d/zabbix-server
useradd zabbix -s /sbin/nologin

vim /etc/rc.d/init.d/zabbix-server #编辑服务端配置文件
BASEDIR=/usr/local/zabbix-3.0.0 #zabbix安装目录
:wq! #保存退出

vim /etc/services
zabbix-agent    10050/tcp               # Zabbix Agent
zabbix-agent    10050/udp               # Zabbix Agent
zabbix-trapper  10051/tcp               # Zabbix Trapper
zabbix-trapper  10051/udp               # Zabbix Trapper

修改配置文件
mkdir /data/www/ && cp -arp php /data/www/
cp -a frontends/php/* /var/www/html/
chown www. -R /var/www/html/
#fping安装
(1)安装
tar -zxvf fping-3.3.tar.gz
cd fping-3.3
./configure && make && make install 
(2）修改fping的权限  ##这一步很重要
chown root:root /usr/local/sbin/fping
chmod u+s /usr/local/sbin/fping 

＃php安装
apt-get install php5 php5-fpm php5-mysql php-apc  php5-gd

修改fpm端口：
vi /etc/php5/fpm/pool.d/www.conf
# 注释掉sock
;listen = /var/run/php5-fpm.sock
# 开启9000端口
listen = 9000

启动php5－fpm: /usr/sbin/php5-fpm

```
#### 3.修改nginx相关配置，启动zabbix-server
```
/etc/init.d/zabbix-server start
```