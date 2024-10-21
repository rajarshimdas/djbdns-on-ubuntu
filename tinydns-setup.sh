#!/bin/bash

read -p "External IP: " extip

sudo tinydns-conf Gtinydns Gdnslog /etc/tinydns $extip
sudo ln -s /etc/tinydns /service/tinydns

exit
