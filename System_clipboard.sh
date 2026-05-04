# use termux api


import subprocess
import time

def clear_clipboard():
    try:
        # Sets the clipboard text to blank
        subprocess.run(['termux-clipboard-set', ' '], check=True)
        print(f"[{time.strftime('%H:%M:%S')}] Clipboard cleared securely.")
    except subprocess.CalledProcessError:
        print("Error. Is Termux:API installed?")

def start_cleaner(interval=60):
    print(f"Clipboard cleaner active. Running every {interval} seconds.")
    print("Press CTRL + C to stop.")
    
    try:
        while True:
            time.sleep(interval)
            clear_clipboard()
    except KeyboardInterrupt:
        print("\nCleaner stopped.")

if __name__ == "__main__":
    start_cleaner(60)
