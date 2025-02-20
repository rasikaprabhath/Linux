#!/bin/bash

# Set the threshold percentage for disk usage
THRESHOLD=95
EMAIL="prabhath@biofoodslk.com"

# Get disk usage for all /home-related directories
df -h | grep '/home' | awk '{print $1, $5, $6}' | while read disk usage mount
do
    # Remove the '%' sign from the usage percentage
    usage=${usage%\%}

    # Check if usage exceeds the threshold
    if [ "$usage" -ge "$THRESHOLD" ]; then
        # Compose the email message
        SUBJECT="Disk Usage Alert: $mount is ${usage}% full"
        MESSAGE="Warning: The disk $disk mounted on $mount is ${usage}% full.\nPlease take action to free up space."

        # Send the email
        echo -e "$MESSAGE" | mail -s "$SUBJECT" "$EMAIL"
    fi
done

