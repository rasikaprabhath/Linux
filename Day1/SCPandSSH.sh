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
    read -p "Please Enter the User Name : " uname
    read -p "please Enter the Password  : " password
    read -p "please Enter the IP Address: " ip

    if [ -z "$uname" ] || [ -z "$password" ];
    then
        echo "hi"
    else
        echo "no"
    fi
elif [ "$input" == "2" ]
then
    echo "SSH"
else
    echo "Invalid input"
fi

