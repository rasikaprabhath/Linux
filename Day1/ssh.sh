#!/bin/bash

echo "You selected SSH (Secure Shell)"
    read -p "Enter username: " username
    read -p "Enter IP address: " ip

    ssh -i ~/.ssh/linuxtest.pem "$username@$ip"
