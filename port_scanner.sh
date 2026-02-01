#!/bin/bash
# Simple bash port scanner
if [ "$1" == "" ]; then
    echo "Usage: ./scan.sh 10.0.0.1"
else
    ip=$1
    for port in {1..100}; do
        timeout 0.1 bash -c "</dev/tcp/$ip/$port" 2>/dev/null && echo "Port $port is open"
    done
fi
