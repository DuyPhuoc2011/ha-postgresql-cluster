#!/bin/sh
echo "Installing prerequesites..."
sudo apt update
sudo hostnamectl set-hostname haproxynode
sudo apt -y install net-tools
sudo apt -y install haproxy
echo "Completed!"