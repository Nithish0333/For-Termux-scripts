#use termux api

import subprocess
import json
import time

def check_messages():
    # Fetch the last 5 SMS messages
    result = subprocess.run(['termux-sms-list', '-l', '5'], capture_output=True, text=True)
    try:
        return json.loads(result.stdout)
    except:
        return []

def send_sms(number, message):
    subprocess.run(['termux-sms-send', '-n', number, message])
    print(f"Replied to {number}")

def get_battery():
    result = subprocess.run(['termux-battery-status'], capture_output=True, text=True)
    data = json.loads(result.stdout)
    return f"{data.get('percentage')}%"

def run_responder():
    print("SMS Responder active. Listening for keyword: WHEREAREYOU")
    processed_ids = set()
    
    try:
        while True:
            messages = check_messages()
            for msg in messages:
                msg_id = msg.get("_id")
                body = msg.get("body", "")
                sender = msg.get("address")
                
                # If keyword found and message is new
                if "WHEREAREYOU" in body.upper() and msg_id not in processed_ids:
                    print(f"Trigger received from {sender}")
                    
                    battery = get_battery()
                    reply = f"Automated Reply: My battery is at {battery}."
                    
                    send_sms(sender, reply)
                    processed_ids.add(msg_id)
                    
            time.sleep(10) # Check every 10 seconds
            
    except KeyboardInterrupt:
        print("\nResponder stopped.")

if __name__ == "__main__":
    run_responder()
