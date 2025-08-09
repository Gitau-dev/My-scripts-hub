#!/bin/bash
	#Purpose of the script is to make sure that server perfomance is good.
	#Checks disk usage automatically(cron services)
	#If threshold is met then a warning is logged and ...also a notification is sent on email as a fast alert
	#An hourly check up also is triggered automatically even when threshold is not met and result is logged
#Destination for the log results
LOG_DIR="$HOME/scripts2/logs"
LOG_FILE="$LOG_DIR/diskalert.log"

mkdir -p "$LOG_DIR"
#The threshold to be met
THRESHOLD=60
#Extract disk usage from root
usage=$(df / | awk 'NR == 2 {print $5}' | sed 's/%//')
#Condition that looks whether threshold is met
if [ "$usage" -gt "$THRESHOLD" ]; then
	echo "$(date): Warning usage exceeded threshold ${THRESHOLD} at ${usage} now!" >> "$LOG_FILE"
else
	echo "$(date): System disk is OK at ${usage} now " >> "$LOG_FILE"
fi
