#!/bin/sh

# Check if the parameter is provided
if [ -z "$1" ]; then
    echo "Please provide a parameter."
    exit 1
fi

echo "Installing prerequisites..."
sudo apt update
sudo hostnamectl set-hostname "$1"
sudo apt -y install net-tools
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" | sudo tee  /etc/apt/sources.list.d/pgdg.list
sudo apt-get update
sudo apt -y install postgresql-14
sudo systemctl stop postgresql
sudo ln -s /usr/lib/postgresql/14/bin/* /usr/sbin/
sudo apt -y install python python3-pip
sudo apt -y install python3-testresources
sudo pip3 install --upgrade setuptools
sudo pip3 install psycopg2-binary
sudo pip3 install patroni
sudo pip3 install python-etcd
echo "Completed!"