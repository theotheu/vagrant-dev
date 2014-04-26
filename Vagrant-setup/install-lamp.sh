#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

# Update everything and remove unnecessary packages
apt-get update -q -y
apt-get upgrade -q -y

# install lamp
### Set password to ensure unattende installation
echo mysql-server mysql-server/root_password password PASSWORD | debconf-set-selections
echo mysql-server mysql-server/root_password_again password PASSWORD | debconf-set-selections

apt-get -q -y install tasksel
tasksel install lamp-server

