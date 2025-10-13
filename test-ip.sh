#!/bin/bash
IP=$1
pkg install -y curl jq traceroute
clear
date
curl -s http://ifconfig.me/all.json | jq .
traceroute -n -m 15 $IP
ping -c 10 $IP
