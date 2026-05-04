# use termux api


import subprocess
import json

def get_location():
    print("Fetching GPS coordinates (stand near a window for better accuracy)...")
    try:
        # Request location from Android
        result = subprocess.run(
            ['termux-location', '-p', 'gps'], 
            capture_output=True, 
            text=True, 
            timeout=15
        )
        
        data = json.loads(result.stdout)
        lat = data.get("latitude")
        lon = data.get("longitude")
        acc = data.get("accuracy")
        
        print("\n📍 Location Acquired:")
        print(f"Latitude:  {lat}")
        print(f"Longitude: {lon}")
        print(f"Accuracy:  {acc} meters")
        
        # Generate Google Maps Link
        maps_link = f"https://google.com{lat},{lon}"
        print(f"\n🗺️ Open in Map: {maps_link}")
        
    except subprocess.TimeoutExpired:
        print("Error: Location request timed out.")
    except Exception as e:
        print(f"Failed to fetch location: {e}")

if __name__ == "__main__":
    get_location()
