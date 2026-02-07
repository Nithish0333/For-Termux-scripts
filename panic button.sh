#!/data/data/com.termux/files/usr/bin/bash
# Get Location (High Accuracy)
LOC=$(termux-location -p network -r last)
LAT=$(echo $LOC | jq '.latitude')
LON=$(echo $LOC | jq '.longitude')

MESSAGE="Emergency! My location: https://maps.google.com"
NUMBER="1234567890" # Replace with your contact

termux-sms-send -n "$NUMBER" "$MESSAGE"
termux-toast "Location sent to $NUMBER"
