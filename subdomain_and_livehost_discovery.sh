#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: ./sub_recon.sh <DOMAIN>"
    echo "Example: ./sub_recon.sh example.com"
    exit 1
fi

DOMAIN=$1
RAW_SUBS_FILE="${DOMAIN}_raw_subs.txt"
ACTIVE_SUBS_FILE="${DOMAIN}_active_subs.txt"

echo "[*] Finding subdomains for $DOMAIN..."
subfinder -d $DOMAIN -o $RAW_SUBS_FILE

echo "[*] Checking for active HTTP/HTTPS services..."
# Use httpx to filter out working subdomains and save to a new file
httpx -l $RAW_SUBS_FILE -silent -status-code 200 -o $ACTIVE_SUBS_FILE

echo "[*] Active subdomains saved to $ACTIVE_SUBS_FILE"
