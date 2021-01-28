#!/bin/bash

echo -n "Name: "
uname -n
echo -n "CPUs: "
grep "physical id" /proc/cpuinfo | sort | uniq | wc -l
echo -n "Cores: "
grep "^processor" /proc/cpuinfo | wc -l
echo -n "Network: "
lspci | egrep  -i --color 'network|ethernet|wireless|wi-fi' | awk '{$1= ""; print $0}'
echo -n "Open Ports: "
 lsof -i -P -n | grep LISTE | awk '{print $9}' | sort | uniq | awk -F ":" '{print $2}' | sort -n | tr '\n' ', '
echo
echo -n "Disk(s): "
fdisk -l | grep -i /dev/sd? | grep -i "Disk"
