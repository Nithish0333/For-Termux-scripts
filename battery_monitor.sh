#!/data/data/com.termux/files/usr/bin/bash
# Get battery percentage
LEVEL=$(termux-battery-status | jq -r '.percentage')

if [ "$LEVEL" -lt 20 ]; then
  termux-notification --title "Low Battery" --content "Level is at $LEVEL%"
  termux-tts-speak "Warning: Your battery is at $LEVEL percent. Please plug in a charger."
fi
