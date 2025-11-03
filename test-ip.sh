#!/bin/bash
IP=$1
if ping -q -c 1 -W 1 google.com &>/dev/null; then
  pkg install -y curl jq traceroute nmap
fi
clear
date
curl -s http://ifconfig.me/all.json | jq .
traceroute -n -m 12 $IP
if ping -q -c 1 -W 1 $IP &>/dev/null; then
  nmap -F --open $IP
else
 nmap -Pn -F --open $IP
fi
