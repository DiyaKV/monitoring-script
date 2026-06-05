#!/bin/bash

# Configuration
THRESHOLD=1
EMAIL="diyakoolothvinod@gmail.com"
HOSTNAME=$(hostname)

# Get disk usage percentage of the root directory
DISK_USAGE=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')

# Check if usage exceeds threshold
if [ "$DISK_USAGE" -gt "$THRESHOLD" ]; then
    SUBJECT="⚠️ ALERT: Low Storage Space on $HOSTNAME"
    BODY="Warning: Disk space utilization is critical.\nUsed Space: $DISK_USAGE%\nThreshold: $THRESHOLD%"
    echo -e "$BODY" | mail -s "$SUBJECT" "$EMAIL"
fi
