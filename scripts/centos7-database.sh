#!/bin/bash

# Database
wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
rpm -ivh mysql-community-release-el7-5.noarch.rpm
yum update
yum install -y mysql mysql-server mysql-devel
systemctl start mysqld.service
mysql -u root -e "SHOW DATABASES";

