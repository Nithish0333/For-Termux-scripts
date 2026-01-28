#!/data/data/com.termux/files/usr/bin/bash
# Capture photo and perform OCR
FILE="ocr_capture.jpg"
OUTPUT="ocr_result"

termux-camera-photo -c 0 "$FILE"
tesseract "$FILE" "$OUTPUT"
cat "${OUTPUT}.txt" | termux-clipboard-set
termux-toast "Text copied to clipboard!"
rm "$FILE" "${OUTPUT}.txt"
