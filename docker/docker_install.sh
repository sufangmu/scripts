#!/bin/bash

#if [ `docker -v | grep 17.03.2-ce | wc -l` -eq 1 ];then
#   echo "Docker 17.03.2-ce Installed! "
#   exit 0
#fi

# Install Docker On Ubuntu16.04
echo "Uninstall old versions"
sudo apt-get remove docker docker-engine docker.io

echo "Update the apt package index"
sudo apt-get update

echo "Install packages to allow apt to use a repository over HTTPS"
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y

echo "Add Docker’s official GPG key"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

echo "set up the stable repository"
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
echo "Update the apt package index."
sudo apt-get update

echo "Install Docker"
sudo apt-get install docker-ce=17.03.2~ce-0~ubuntu-xenial  -y

echo "Set autostart on reboot"
sudo systemctl enable docker

echo "Install completed !"
