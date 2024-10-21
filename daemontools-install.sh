#!/bin/bash

# Variable
sourcefolder="/home/rd/bin/djbdns-on-ubuntu"

# Get the compiler tools
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install gcc make csh

# Install Daemontools
sudo mkdir -p /package
sudo chmod 1755 /package
cd /package/

# Get daemontools and djbdns in package folder
# sudo wget https://cr.yp.to/daemontools/daemontools-0.76.tar.gz
sudo cp $sourcefolder/package/* /package/

sudo gunzip daemontools-0.76.tar.gz
sudo tar -xpf daemontools-0.76.tar
sudo rm -f daemontools-0.76.tar

# Fix error.h
sudo cp $sourcefolder/errno-fix/error-daemontools.h /package/admin/daemontools-0.76/src/error.h

# Compile
cd /package/admin/daemontools-0.76/
sudo package/install

# echo "Fix rc.local"
sudo cp $sourcefolder/misc/rc.local.txt /etc/rc.local
sudo chmod +x /etc/rc.local

echo "\n\nReboot.\n"
echo "After Reboot test daemontools is running"
echo "ps aux | grep svscan"
exit
