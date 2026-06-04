#!/bin/bash

# Configuration
THRESHOLD=80
EMAIL="diyakoolothvinod@gmail.com"
HOSTNAME=$(hostname)

# Get current CPU usage (subtracts idle time from 100)
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')

# Check if usage exceeds threshold
if (( $(echo "$CPU_USAGE > $THRESHOLD" | bc -l) )); then
    SUBJECT="⚠️ ALERT: High CPU Usage on $HOSTNAME"
    BODY="Warning: CPU usage has exceeded the threshold.\nCurrent Usage: $CPU_USAGE%\nThreshold: $THRESHOLD%"
    echo -e "$BODY" | mail -s "$SUBJECT" "$EMAIL"
fi
