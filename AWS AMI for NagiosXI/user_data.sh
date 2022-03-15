#!/bin/bash

sudo yum update -y
sudo yum install curl -y
curl https://assets.nagios.com/downloads/nagiosxi/install.sh | sudo sh
sudo getenforce
sudo sed 's/SELINUX=permissive/SELINUX=enforcing/g'  /etc/sysconfig/selinux -i
sudo setenforce 0

	



