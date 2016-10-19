#!/bin/bash

yum update -y --exclude=kernel
yum install -y vim git unzip screen wget nc telnet net-tools

#Enable ssh passwords (For testing)
sed -e '/PasswordAuthentication\ no/ s/^#*/#/' -i /etc/ssh/sshd_config
sed -e '/PasswordAuthentication\ yes/ s/^#*//' -i /etc/ssh/sshd_config

systemctl restart sshd

