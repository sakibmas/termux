#!/bin/bash
IP=$1
if ping -q -c 1 -W 1 google.com &>/dev/null; then
  pkg install -y curl jq traceroute
fi
clear
date
curl -s http://ifconfig.me/all.json | jq .
traceroute -n -m 12 $IP
ping -c 10 $IP
