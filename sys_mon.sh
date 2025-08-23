#!/bin/bash

	#check for mem usage
	#check for disk usage
	#check for cpu usage
option_check() {
echo "Type system service you want to check:"
echo "Services are; Memory and Disk"
read service
c_service=$(echo "$service" | tr '[:upper:]' '[:lower:]')
if [[ "$c_service" == "memory" ]]; then
	memory_check
elif [[ "$c_service" == "disk" ]]; then
	disk_check
else
	echo "Please type either of this services: memory or disk"
fi
}
#....for memory
memory_check() {
threshold_m=70
mem=$(free -m | awk 'NR == 2 {print $3} ')
mem1=$(free -m | awk 'NR == 2 {print $2}')
memo=$(echo "scale=2; $mem/$mem1*100" | bc -l )


if [[ "$memo" -gt "$threshold_m" ]]; then
	echo "Warning: Threshold is met. Now at $memo%"
else
	echo "Memory usage is ok. Now at $memo%"
fi
}

#....for disk
disk_check() {
threshold_d=70
disk=$(df -h | awk 'NR == 3 {print $5}' | sed 's/%//')
if [[ "$disk" -gt "$threshold_d" ]]; then 
	echo "Disk usage is above threshold. Now at $disk%"
else
	echo "Disk usage is good at the moment now at $disk%"
fi
}

option_check
