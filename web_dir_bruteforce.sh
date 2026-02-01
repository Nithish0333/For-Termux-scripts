#!/bin/bash

# Check for correct usage
if [ "$#" -ne 2 ]; then
    echo "Usage: ./web_enum.sh <URL> <WORDLIST_PATH>"
    echo "Example: ./web_enum.sh http://example.com /usr/share/wordlists/dirb/common.txt"
    exit 1
fi

URL=$1
WORDLIST=$2
OUTPUT_FILE="${URL}_dirs.txt"

# Check if gobuster is installed
if ! command -v gobuster &> /dev/null
then
    echo "gobuster could not be found, please install it first."
    exit 1
fi

# Check if wordlist file exists
if [ ! -f "$WORDLIST" ]; then
    echo "Wordlist file not found at $WORDLIST"
    exit 1
fi

echo "[*] Starting directory enumeration on $URL using $WORDLIST"
gobuster dir -u $URL -w $WORDLIST -o $OUTPUT_FILE
echo "[*] Scan complete. Results saved in $OUTPUT_FILE"
