#!/data/data/com.termux/files/usr/bin/bash
# Simple Morse SOS ( . . .  - - -  . . . )
sos() {
  for i in {1..3}; do termux-torch on; sleep 0.2; termux-torch off; sleep 0.2; done # S
  for i in {1..3}; do termux-torch on; sleep 0.6; termux-torch off; sleep 0.2; done # O
  for i in {1..3}; do termux-torch on; sleep 0.2; termux-torch off; sleep 0.2; done # S
}
termux-toast "Signaling SOS..."
sos
