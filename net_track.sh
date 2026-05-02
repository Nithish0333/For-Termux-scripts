#!/bin/bash
while true; do
    clear
    echo "=== ACTIVE CONNECTIONS ==="
    netstat -antp | grep ESTABLISHED | awk '{print $5}' | cut -d: -f1 | sort | uniq -c
    echo "=========================="
    sleep 5
done
