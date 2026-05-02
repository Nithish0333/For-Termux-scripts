#!/bin/bash
while true; do
    clear
    echo "=== [TERMUX HUD] ==="
    echo "Time: $(date +'%T')"
    echo "Storage Free: $(df -h / | awk 'NR==2 {print $4}')"
    echo "Memory Free: $(free -h | awk 'NR==2 {print $4}')"
    echo "===================="
    sleep 2
done
