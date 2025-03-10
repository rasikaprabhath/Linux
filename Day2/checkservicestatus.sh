#!/bin/bash

# enter the service name and checks service status.


echo "enter the service name"
read service
if systemctl is-active --quiet $service
then
    echo "$service is running"
else
    echo " $service is restarting ....."
    systemctl restart --quiet $service
    if systemctl is-active --quiet $service
    then
        echo " $service is restarted suscessfully "
    else
        echo " $service restarting failed ..."
    fi
fi