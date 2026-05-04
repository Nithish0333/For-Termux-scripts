# use pip install requests


import requests

def get_weather(city_name=""):
    # wttr.in is an excellent API that serves terminal-friendly UI
    url = f"https://wttr.in{city_name}"
    
    # Restrict to current weather + 1-day forecast to fit mobile screens
    params = {'n': '', '1': ''} 
    
    try:
        print(f"Fetching weather for: {city_name if city_name else 'your current location'}...")
        response = requests.get(url, params=params)
        
        if response.status_code == 200:
            print("\n" + response.text)
        else:
            print(f"Failed to fetch weather. HTTP Status: {response.status_code}")
            
    except Exception as e:
        print(f"Network error: {e}")

if __name__ == "__main__":
    # Leave blank for auto-detected location based on IP, or type a city
    city = "London" 
    get_weather(city)
