#!/data/data/com.termux/files/usr/bin/bash
LOCAL_IP=$(ifconfig wlan0 | grep 'inet ' | awk '{print $2}')
PUBLIC_IP=$(curl -s https://ifconfig.me)
WIFI_INFO=$(termux-wifi-connectioninfo | jq -r '.ssid')

echo "Connected to: $WIFI_INFO"
echo "Local IP: $LOCAL_IP"
echo "Public IP: $PUBLIC_IP"
