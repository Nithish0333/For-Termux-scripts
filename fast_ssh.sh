#!/data/data/com.termux/files/usr/bin/bash
# Quick SSH shortcut
USER="your_username"
IP="192.168.1.100" # Replace with your server IP
PORT="22"

ssh -p "$PORT" "$USER@$IP"
