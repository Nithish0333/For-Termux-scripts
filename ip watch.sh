#!/bin/bash
OLD_IP=""
while true; do
    CURRENT_IP=$(curl -s https://ifconfig.me)
    if [ "$CURRENT_IP" != "$OLD_IP" ]; then
        echo "IP Changed! New IP: $CURRENT_IP"
        OLD_IP="$CURRENT_IP"
    fi
    sleep 60
done
