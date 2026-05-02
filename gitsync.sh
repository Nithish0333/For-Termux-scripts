#!/bin/bash
git add .
git commit -m "Termux auto-commit on $(date)"
git push origin main
echo "Pushed to repository!"
