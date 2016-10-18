#!/bin/bash

yum update -y --exclude=kernel
yum install -y  nano git unzip screen wget
yum install -y httpd httpd-devel httpd-tools
systemctl start httpd.service
systemctl stop httpd.service

rm -rf /var/www/html
ln -s /vagrant /var/www/html

yum install -y php php-cli php-common php-devel

wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
rpm -ivh mysql-community-release-el7-5.noarch.rpm
yum update 
yum install -y mysql mysql-server mysql-devel
systemctl start mysqld.service
mysql -u root -e "SHOW DATABASES";

systemctl start httpd.service
