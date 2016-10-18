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

cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/MikelSwartz/vagrant/master/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/MikelSwartz/vagrant/master/files/info.php


chcon -v --type=httpd_sys_content_t /var/www/html/index.html
chcon -v --type=httpd_sys_content_t /var/www/html/info.php

systemctl start httpd.service
