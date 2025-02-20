#!/bin/bash

#script to extract the users of a given Group Name. Group ID is passed through the command line

if [ -z "$1" ]; then
	echo "You need to provide the group name : $0 <Group Name> "
	exit 1
fi

gid=$(grep "$1:" /etc/group | cut -d: -f3)

if [ -z $gid ]; then
	echo " provided group does not exit. Pls check the group name again"
	exit 1
else
	echo $gid
	user=$(grep "^[^:]*:[^:]*:[^:]*:$gid:" /etc/passwd | cut -d: -f1)
	echo "User Name for the Group $gid is $user" 
fi


