#!/bin/bash

# Variable
sourcefolder="/home/rd/bin/djbdns-on-ubuntu"

# Create user and group
sudo groupadd -r djbdns
sudo useradd -g djbdns -r Gdnscache
sudo useradd -g djbdns -r Gtinydns
sudo useradd -g djbdns -r Gdnslog

# Prepaire source files
cd /package/
# Source was copied while installing daemontools.
# sudo wget https://cr.yp.to/djbdns/djbdns-1.05.tar.gz
sudo gunzip djbdns-1.05.tar.gz
sudo tar -xf djbdns-1.05.tar

# Fix error.h
sudo cp $sourcefolder/errno-fix/error-djbdns.h /package/djbdns-1.05/error.h

# Compile
cd /package/djbdns-1.05/

# Make
sudo make
sudo make setup check

# Setup local cache
sudo dnscache-conf Gdnscache Gdnslog /etc/dnscache
sudo ln -s /etc/dnscache /service/dnscache

# Update rootservers
sudo cp $sourcefolder/misc/root-servers.txt /etc/dnscache/root/servers/\@

# Keep a copy of original resolv.conf and create a new one. 
sudo cp /etc/resolv.conf /package/
sudo rm /etc/resolv.conf
# sudo touch /etc/resolv.conf
sudo cp $sourcefolder/misc/resolv.txt /etc/resolv.conf


echo "\ndjbdns installed."
echo "Dnscache configured on 127.0.0.1..."
exit
