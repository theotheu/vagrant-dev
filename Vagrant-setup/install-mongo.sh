#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

# Update everything and remove unnecessary packages
apt-get update -q -y
apt-get upgrade -q -y

# install mongodb
apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
echo "deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen" | tee -a /etc/apt/sources.list.d/10gen.list
apt-get -y -q update
apt-get -y -q install mongodb-10gen
