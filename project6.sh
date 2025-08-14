 #!/bin/bash
		#MEMORY USAGE CHECKUP
		#====================

	#Checks memory usage and logs results automatically

#Threshold that need not to be exceeded
max_limit=600000 #in kilobytes

#A command that extracts the mem usage
used=$(free | awk 'NR == 2 {print $3}')

#Logic that checks whether threshold have exceeded or not ...and either results gets logged
if [[ "$used" -gt "$max_limit" ]]; then
	echo " $(date): WARNING: Machine is at risk!" >> project6_logs.log
else
	echo "$(date): Safe and ok" >> project6_logs.log
fi
