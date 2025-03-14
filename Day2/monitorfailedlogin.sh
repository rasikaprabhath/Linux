#!/bin/bash

#monitor the failed SSH logins due to password error and ban the IP


logfile="/var/log/auth.log"
threshold=5
banIPlist="/tmp/banned_ips.txt"

grep "password" $logfile | awk '{print $(NF-3)}' | sort | uniq -c | while read count ip; do
    if [ $count -ge $threshold ]; then
        echo "Blocking IP......: $ip"
        iptables -A INPUT -s $ip -j DROP
        echo "$ip" >> $banIPlist
    fi
done
