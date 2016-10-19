#!/bin/bash

# Apache
yum install -y httpd httpd-devel httpd-tools
systemctl start httpd.service
systemctl stop httpd.service

rm -rf /var/www/html
ln -s /vagrant /var/www/html

# PHP
yum install -y php php-cli php-common php-devel


# Download GitHub Content
cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/MikelSwartz/vagrant/master/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/MikelSwartz/vagrant/master/files/info.php


chcon -v --type=httpd_sys_content_t /var/www/html/index.html
chcon -v --type=httpd_sys_content_t /var/www/html/info.php

systemctl start httpd.service
