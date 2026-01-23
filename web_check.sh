#!/bin/bash
URL="https://example.com"

if curl -s --head "$URL" | grep "200 OK" > /dev/null; then
    echo "Website is UP"
else
    echo "Website is DOWN"
fi
