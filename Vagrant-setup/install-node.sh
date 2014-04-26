#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

# Update everything and remove unnecessary packages
apt-get update -q -y
apt-get upgrade -q -y

# install node.js
apt-get install -q -y build-essential curl
cd /tmp
wget http://nodejs.org/dist/node-latest.tar.gz
tar -zxvf node-latest.tar.gz
cd node-v*
./configure
make
make install
