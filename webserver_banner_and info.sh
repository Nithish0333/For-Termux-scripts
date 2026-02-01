#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: ./banner_grab.sh <URL>"
    echo "Example: ./banner_grab.sh http://example.com"
    exit 1
fi

TARGET=$1

echo "[*] Fetching HTTP headers from $TARGET"
# -I option shows headers only, -s makes it silent (no progress meter), -L follows redirects
curl -IsL $TARGET | grep -E 'Server|X-Powered-By|Content-Type'
