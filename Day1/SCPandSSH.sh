#!/bin/bash

# this is to demonstrate remote login and file transfer
# Requirement
#Provide a menu to user to select ssh or scp based on user selection. Ask for user name and ip-address.
#For scp ask user for direction of copy
#   remote to local
#   local to remote.
#copy file to destination home directory with same source file name.
#Ask for source/destination file location. If no destination location is provided
#If user gives destination along with filename, keep that as destination filename.
#If user provides only destination location (no file name), keep as source file name
#Note: User knows the password of the remote client (user).


read -p "Enter 1 for  SCP and 2 for SSH : " input


if [ "$input" == "1" ]
then
    echo "SCP"
    read -p "please Enter the IP Address: " ip
    read -p "Please Enter the User Name : " uname
    read -p "please Enter the Password  : " password
    
    if [[ $ip =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]];
    
    then
        IFS='.' read -r -a octets <<< "$ip"
        
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


    if [ -z "$uname" ] || [ -z "$password" ];
    then
        echo "User Name or Password cannot be Empty"
    else
        echo "User Name And Passwrod are not empty"
    fi
elif [ "$input" == "2" ]
then
    echo "SSH"
else
    echo "Invalid input"
fi

