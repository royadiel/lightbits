#!/bin/bash
if [ "$1" = "" ] 
	then
	echo 
	echo "Linux Collection Script" 
	echo "-----------------------"
	echo "Syntax: iv.sh [username] " ; 
exit 
fi
mkdir -p output

for a in `cat ips.txt` ; do 
ssh $1@$a "bash -s" < ./collect.sh | tee output/inv_$a"_"`date +"%m%d%Y-%H%M%S"`
done

