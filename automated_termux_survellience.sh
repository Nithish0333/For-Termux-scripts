#use termux api tool


import subprocess
import time
import os

# Create a folder to save photos
SAVE_DIR = "/data/data/com.termux/files/home/surveillance"
os.makedirs(SAVE_DIR, exist_ok=True)

def take_photo():
    timestamp = time.strftime("%Y%m%d-%H%M%S")
    filepath = f"{SAVE_DIR}/img_{timestamp}.jpg"
    
    # 0 is usually the back camera, 1 is the front camera
    try:
        subprocess.run(['termux-camera-photo', '-c', '0', filepath], check=True)
        print(f"Photo saved: {filepath}")
    except subprocess.CalledProcessError:
        print("Failed to take photo. Check Termux:API permissions.")

def start_surveillance(interval_seconds=60):
    print(f"Surveillance started. Capturing every {interval_seconds} seconds.")
    print(f"Photos are saved in: {SAVE_DIR}")
    
    try:
        while True:
            take_photo()
            time.sleep(interval_seconds)
    except KeyboardInterrupt:
        print("\nSurveillance stopped by user.")

if __name__ == "__main__":
    # Takes a picture every 60 seconds
    start_surveillance(interval_seconds=60)
