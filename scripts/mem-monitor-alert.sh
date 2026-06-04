#!/bin/bash

# Configuration
THRESHOLD=1
EMAIL="diyakoolothvinod@gmail.com"
HOSTNAME=$(hostname)

# Calculate Memory Usage Percentage
MEM_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')

# Check if usage exceeds threshold
if (( $(echo "$MEM_USAGE > $THRESHOLD" | bc -l) )); then
    SUBJECT="⚠️ ALERT: High Memory Usage on $HOSTNAME"
    BODY="Warning: RAM usage has crossed the limit.\nCurrent Usage: $(printf "%.2f" $MEM_USAGE)%\nThreshold: $THRESHOLD%"
    echo -e "$BODY" | mail -s "$SUBJECT" "$EMAIL"
fi
