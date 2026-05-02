#!/bin/bash
if pgrep -x "sshd" >/dev/null; then
    pkill sshd
    echo "SSH Server Stopped."
else
    sshd
    echo "SSH Server Started on Port 8022."
    echo "Your IP: $(ifconfig wlan0 | grep 'inet ' | awk '{print $2}')"
fi
