#!/bin/bash
sudo yum update -y
sudo yum install wget -y
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum install epel-release -y
sudo yum install jenkins java-1.8.0-openjdk-devel -y
sudo getenforce
sudo sed 's/SELINUX=permissive/SELINUX=enforcing/g'  /etc/sysconfig/selinux -i
sudo setenforce 0
sudo systemctl restart jenkins
sudo systemctl enable jenkins

