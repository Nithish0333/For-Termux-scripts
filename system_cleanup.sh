#!/data/data/com.termux/files/usr/bin/bash
echo "Updating packages..."
pkg update && pkg upgrade -y
echo "Cleaning cache..."
apt autoremove -y && apt clean
rm -rf ~/.cache/*
