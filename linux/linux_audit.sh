#!/bin/bash
#This script is used for initial analysis of linux boxes
#Lynis is a security audit tool for Linux
#It can be used as a security scanner

wget https://cisofy.com/files/lynis-2.4.8.tar.gz

tar -xvzf lynis-2.4.8.tar.gz

cd lynis

sudo ./lynis audit system

#Remote systems can be audited by
#sudo ./lynis audit system <ip address>

