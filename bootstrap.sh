#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

# Set time zone
apt-get install -q -y ntp
echo "ntpdate ntp.ubuntu.com pool.ntp.org" > /etc/cron.daily/ntpdate
echo "server pool.ntp.org" >> /etc/ntp.conf
echo "Europe/Amsterdam" > /etc/timezone
dpkg-reconfigure --frontend noninteractive tzdata

# Update everything and remove unnecessary packages
apt-get update -q -y
apt-get upgrade -q -y
apt-get dist-upgrade -q -y
apt-get autoremove -q -y

# install packages
apt-get -y -q install curl wget git

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

# install lamp
### Set password to ensure unattende installation
echo mysql-server mysql-server/root_password password vagrant | debconf-set-selections
echo mysql-server mysql-server/root_password_again password vagrant | debconf-set-selections

apt-get -q -y install tasksel
tasksel install lamp-server

### Set privileges for mysql users
mysql -u root -p'vagrant' <<EOF
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'vagrant' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'vagrant'@'%' IDENTIFIED BY 'vagrant' WITH GRANT OPTION;
flush privileges;
EOF

### Edit my.cnf to listen to remote hosts
service mysql stop
sed -i "s/^bind-address/#bind-address/" "/etc/mysql/my.cnf"
service mysql start

# install java
### Unattented install, tnx to http://askubuntu.com/questions/190582/installing-java-automatically-with-silent-option
echo debconf shared/accepted-oracle-license-v1-1 select true |  sudo debconf-set-selections

echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections

echo
echo
echo
echo Please wait...
echo
echo
echo

apt-get install -q -y apt-file && apt-file update

apt-file search add-apt-repository

apt-get install -q -y python-software-properties

apt-get install -q -y software-properties-common

apt-get update && apt-get upgrade

add-apt-repository ppa:webupd8team/java

apt-get update && sudo apt-get install -q -y oracle-jdk7-installer

update-alternatives --display java

echo "JAVA_HOME=/usr/lib/jvm/java-7-oracle/" >> /etc/environment

# install maven
apt-get install -q -y maven
