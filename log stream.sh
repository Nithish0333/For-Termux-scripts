#!/bin/bash
echo "Streaming live Android logs (Press CTRL+C to stop)..."
logcat | grep --color=always -i "error\|warning"
