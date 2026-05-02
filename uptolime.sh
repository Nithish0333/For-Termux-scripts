#!/bin/bash
URL="https://example.com"
while true; do
    STATUS=$(curl -o /dev/null -s -w "%{http_code}" "$URL")
    if [ "$STATUS" -ne 200 ]; then
        termux-notification -t "Website Down!" -c "$URL is unreachable (Code: $STATUS)"
        termux-vibrate -d 1000
    fi
    sleep 300
done
