#!/bin/bash
#
# iptables example configuration script
#
# Flush all current rules from iptables
#
 iptables -F
#
# Allow SSH connections on tcp port 22
# This is essential when working on remote servers via SSH to prevent locking yourself out of the system


 iptables -A INPUT -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
#
 iptables -A INPUT -p tcp --dport 20 -j ACCEPT
 iptables -A INPUT -p tcp --dport 21 -j ACCEPT
 
iptables -A OUTPUT -p tcp --dport 3306 --dst X.X.X.X -j ACCEPT	
iptables -A INPUT -p tcp --sport 3306 --src X.X.X.X -j ACCEPT 

iptables -A OUTPUT -p tcp --dport 9000 --dst 10.21.X.10 -j ACCEPT
#
# Set default policies for INPUT, FORWARD and OUTPUT chains
#
 iptables -P INPUT ACCEPT
 iptables -P FORWARD DROP
 iptables -P OUTPUT ACCEPT
#
# Set access for localhost
#
 iptables -A INPUT -i lo -j ACCEPT
#
# Accept packets belonging to established and related connections
#
 iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
 
 iptables -A INPUT -j DROP
 iptables -A OUTPUT -j DROP
#
# Save settings
#
 /sbin/service iptables save
#
# List rules
#
 iptables -L -v
