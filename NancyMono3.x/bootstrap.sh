#!/bin/bash
MONO3_VERSION="mono-3.0.12"
MONO3_BINARY="http://download.mono-project.com/sources/mono/$MONO3_VERSION.tar.bz2"

#apt-get update
#apt-get upgrade
apt-get install -y ruby
apt-get install -y wget
apt-get install -y build-essentials
apt-get install -y gettext

echo "Grabbing: $MONO3_BINARY"
wget $MONO3_BINARY
tar -xjf $MONO3_VERSION.tar.bz2

cd "$MONO3_VERSION"

./configure --prefix=/usr/local
make
make install

gem install rake
gem install albacore
cd /vagrant
echo cd \/vagrant > /home/vagrant/.bashrc
rm -rf /etc/motd

echo Nancy on Mono >> /etc/motd
echo +++++++++++++ >> /etc/motd
echo >> /etc/motd
echo The directory you are now in is shared with the host \(the same directory as you copied the vagrantfile into\) - on your local machine clone the source as you would normally then inside this VM type \"cd \[directory name\]\" then \"rake mono\" and observe the output. >> /etc/motd

