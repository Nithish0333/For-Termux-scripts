#!/bin/bash
TARGET="/sdcard/Download/"
DEST="$HOME/extracted_pdfs"
mkdir -p "$DEST"
echo "Extracting PDFs..."
find "$TARGET" -iname "*.pdf" -exec cp {} "$DEST" \;
echo "Done! Check $DEST"
