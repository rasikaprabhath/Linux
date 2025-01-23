#!/bin/bash

#Validate IP address format

ip="192.168.1.2002"

if [[ $ip =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]];
#regular expression to check valid string. {1,3} means 1 to 3 digit from {0 to 9} numbers ex. 192 or 1 or 20
# these 3 digit numbers are seprated by a "." \ is the escape chracter
then
    # Split the IP address and check each octet

    IFS='.' read -r -a octets <<< "$ip"
 # IFS is the Internal Field Seperator used to seprate the sring by the "."
 # value in the IP is passed to "octets" array 

    valid=true
        for octet in "${octets[@]}"; # @ means all the elements in the array
        do
            if ((octet < 0 || octet > 255)); then
                valid=false
                break
            fi
        done

        if [ "$valid" = true ]; then
            echo "Valid IP address."
        else
            echo "Invalid IP address: Each octet should be between 0 and 255."
        fi
else
    echo "Invalid IP address format."
fi
