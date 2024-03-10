#!/bin/sh
echo "Installing prerequesites..."
sudo apt update
sudo hostnamectl set-hostname etcdnode
sudo apt -y install net-tools
sudo apt -y install etcd 
echo "Completed!"
