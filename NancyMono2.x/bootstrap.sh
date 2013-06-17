#!/bin/bash
apt-get update
apt-get upgrade
apt-get install -y mono-complete
apt-get install -y ruby
gem install rake
gem install albacore
cd /vagrant
echo cd \/vagrant > /home/vagrant/.bashrc
rm -rf /etc/motd

echo Nancy on Mono >> /etc/motd
echo +++++++++++++ >> /etc/motd
echo >> /etc/motd
echo The directory you are now in is shared with the host \(the same directory as you copied the vagrantfile into\) - on your local machine clone the source as you would normally then inside this VM type \"cd \[directory name\]\" then \"rake mono\" and observe the output. >> /etc/motd
