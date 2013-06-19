#!/bin/bash
MONO3_VERSION="mono-3.0.12"
MONO3_BINARY="http://download.mono-project.com/sources/mono/$MONO3_VERSION.tar.bz2"

apt-get update
#apt-get upgrade
apt-get install -y ruby
apt-get install -y curl

echo "Grabbing: $MONO3_BINARY"
curl $MONO3_BINARY -o - | tar xj -C "~/mono" -f -

cd "~/mono/$MONO3_VERSION"
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

