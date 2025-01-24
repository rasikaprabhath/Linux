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

#-------------------------------------------------------------
# Selection for SCP 

read -p "Enter 1 for  SCP and 2 for SSH : " input


if [ "$input" == "1" ]
then
    echo "You selected SCP (Secure Copy Protocol)"
    read -p "please Enter the IP Address: " ip
    read -p "Please Enter the User Name : " uname
    read -p "Enter the direction of transfer: 1 for Remote to Local, 2 for Local to Remote : " direction


    # check the validity of IP address
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

#check the validity of the User Name
    uvalidity=false
    if [ -z "$uname" ];
    then
        echo "User Name cannot be Empty"
    else
        echo "User Name is not empty"
        uvalidity=true 
    fi
#copying the file by SCP - remote to local
    if [[ "$direction" == "1" ]];
    read -p "Enter the source file to copy : " filename
    read -p "enter the (local) path that the file should be copied : " lpath
    then
        #if the local path is not given, copy to the home directory
        if [[ -z "$lpath" ]];
        then
            lpath="$HOME/$(basename "$filename")"
        # if the destination path is given, copy to it   
        elif [[ -d "$lpath" ]];
        then
            lpath="$lpath/$(basename "$filename")"
        fi
        
        scp "$uname@$ip:$filename" "$lpath"
        echo "File $filename copied to $lpath"

    # copying from local to remote using SCP
    elif [ "$direction" == "2" ]; then
        read -p "Enter local source file path: " local_file
        read -p "Enter remote destination path (default: home directory): " remote_path

        # If no destination is provided, use home directory
        if [ -z "$remote_path" ]; then
            remote_path="~"
        elif ssh "$uname@$ip" "[ -d $remote_path ]"; then
            remote_path="$remote_path/$(basename "$local_file")"
        fi

        scp "$local_file" "$uname@$ip:$remote_path"
        echo "File copied to remote destination $remote_path"
    else
        echo "Invalid direction selected"
    fi






#----------------------------------------------------
# Selection for SSH connection
elif [ "$input" == "2" ]; then
    echo "You selected SSH (Secure Shell)"
    read -p "Enter username: " username
    read -p "Enter IP address: " ip

    ssh "$username@$ip"
else
    echo "Invalid input. Please enter 1 for SCP or 2 for SSH."
fi


