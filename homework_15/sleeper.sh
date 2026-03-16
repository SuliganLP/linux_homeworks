#!/bin/bash

for i in {1..10}
do
	echo "$(date +%H:%M:%S) $(ps -e --no-headers | wc -l)"
	sleep 1
done

lscpu > cpuinfo.txt
cat /etc/os-release > os_full_info.txt 
grep "^NAME=" /etc/os-release | sed 's/NAME="//; s/"//' > os_name.txt

for i in {50..100}
do
	touch "${i}.txt"
done
