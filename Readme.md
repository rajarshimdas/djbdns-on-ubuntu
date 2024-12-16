# Scripts to install djbdns on Ubuntu

git@github.com:rajarshimdas/djbdns-on-ubuntu.git

Created: 10-Jul-2021

Updated: 20-Oct-2024 Works on Ubuntu 24.04 LTS

1. Extract/Clone repo in /home/rd/bin folder (Create folder if required and delete after setup).

2. Run install scripts. 

3. Change /service/tinydns/run file to have softlimit -d600000 (Ubuntu 22.04 LTS onwards requires this change)

4. A sample Makefile for primary dns is available in the Readme folder.

Reference:

https://cr.yp.to/daemontools.html

https://cr.yp.to/djbdns.html

