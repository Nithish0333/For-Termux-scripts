#use termux api



import subprocess
import json
import time
import math

def get_accelerometer():
    # Read sensor data once
    result = subprocess.run(['termux-sensor', '-n', '1', '-s', 'Accelerometer'], capture_output=True, text=True)
    data = json.loads(result.stdout)
    
    # Extract X, Y, Z values
    accel = data.get("Accelerometer", {}).get("values", [0, 0, 0])
    return accel

def trigger_alarm():
    print("🚨 MOTION DETECTED! Alarm triggered!")
    # Vibrate the phone for 2 seconds
    subprocess.run(['termux-vibrate', '-d', '2000'])

def start_security():
    print("Calibrating sensor... Keep the phone still.")
    time.sleep(2)
    
    # Get baseline values
    base_x, base_y, base_z = get_accelerometer()
    print("System armed. Monitoring for movement...")
    
    # Sensitivity threshold (adjust higher if too sensitive)
    threshold = 1.5 
    
    try:
        while True:
            time.sleep(0.5)
            x, y, z = get_accelerometer()
            
            # Calculate distance between current movement and baseline
            movement = math.sqrt((x - base_x)**2 + (y - base_y)**2 + (z - base_z)**2)
            
            if movement > threshold:
                trigger_alarm()
                # Re-calibrate baseline after alarm
                base_x, base_y, base_z = x, y, z
                
    except KeyboardInterrupt:
        print("\nSecurity system disarmed.")

if __name__ == "__main__":
    start_security()
