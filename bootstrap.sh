#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

# Set time zone
apt-get install -q -y ntp
echo "ntpdate ntp.ubuntu.com pool.ntp.org" > /etc/cron.daily/ntpdate
echo "server pool.ntp.org" >> /etc/ntp.conf
echo "Europe/Amsterdam" > /etc/timezone
dpkg-reconfigure --frontend noninteractive tzdata

apt-get update -q -y
apt-get upgrade -q -y

apt-get -y -q install curl wget

# install mongodb
apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
echo "deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen" | tee -a /etc/apt/sources.list.d/10gen.list
apt-get -y -q update
apt-get -y -q install mongodb-10gen

# install node.js
apt-get install -q -y build-essential curl
cd /tmp
wget http://nodejs.org/dist/node-latest.tar.gz
tar -zxvf node-latest.tar.gz
cd node-v*
./configure
make
make install

# install git
apt-get -q -y git svn

# install lamp
### Set password to ensure unattende installation
echo mysql-server mysql-server/root_password password PASSWORD | debconf-set-selections
echo mysql-server mysql-server/root_password_again password PASSWORD | debconf-set-selections

apt-get -q -y install tasksel
tasksel install lamp-server



