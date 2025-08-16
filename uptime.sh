#!/bin/bash

uptime=$(uptime -p)
echo "$(date): $uptime" >> uptimelogs.log

echo "Log for uptime $uptime updated successfully!"

