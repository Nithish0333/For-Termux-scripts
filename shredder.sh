#!/bin/bash
read -p "Enter full path of file to shred: " FILE
if [ -f "$FILE" ]; then
    echo "Shredding $FILE..."
    dd if=/dev/urandom of="$FILE" bs=1k count=$(du -k "$FILE" | cut -f1) conv=notrunc
    rm -rf "$FILE"
    echo "File securely destroyed."
else
    echo "File not found!"
fi
