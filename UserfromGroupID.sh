#!/bin/bash

#script to extract the users of a given Group Name. Group ID is passed through the command line


if [ -z "$1" ]; then  #checking if the group name is empty inth ecommand line
	echo "You need to provide the group name : $0 <Group Name> "
	exit 1
fi

#assigning the group id to gid variable. gid is obtained from the /etc/group file by extrating
#from the delimeter ":" it is the 3rd field in the line. $1 is the group name (second word) passed
#from the  command line
gid=$(grep "$1:" /etc/group | cut -d: -f3)

if [ -z $gid ]; then
	echo " provided group does not exit. Pls check the group name again"
	exit 1
else
	#extracting the username from the /etc/passwd file which matches the gid
	user=$(grep "^[^:]*:[^:]*:[^:]*:$gid:" /etc/passwd | cut -d: -f1)
	echo "User Name for the Group $gid is $user" 
fi


