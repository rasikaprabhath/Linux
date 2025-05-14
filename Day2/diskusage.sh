#!/bin/bash

#This script is to monitor the disk usage of a linux system and alert when the limit is exceeded

#!/bin/bash

THRESHOLD=2
df -h | awk 'NR>1 {print $5 " " $6}' | while read output;
do
    usage=$(echo $output | awk '{print $1}' | sed 's/%//')
    if [ $usage -ge $THRESHOLD ];then
        partition=$(echo $output | awk '{print $2}')
        echo "warning disk on $partition has exceeded the limit of $THRESHOLD% " | mail -s " Threshold exceeded" aaaa@bio.com
    fi
done

