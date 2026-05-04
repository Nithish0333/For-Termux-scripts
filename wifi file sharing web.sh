import http.server
import socketserver
import socket

PORT = 8080

def get_local_ip():
    # Detects the phone's IP address on the Wi-Fi network
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    try:
        s.connect(('8.8.8.8', 80))
        ip = s.getsockname()[0]
    except Exception:
        ip = '127.0.0.1'
    finally:
        s.close()
    return ip

def start_server():
    Handler = http.server.SimpleHTTPRequestHandler
    local_ip = get_local_ip()
    
    print(f"Starting server in your current directory...")
    print(f"🔗 Access files at: http://{local_ip}:{PORT}")
    print("Press CTRL + C to stop the server.")
    
    try:
        with socketserver.TCPServer(("", PORT), Handler) as httpd:
            httpd.serve_forever()
    except KeyboardInterrupt:
        print("\nServer stopped.")

if __name__ == "__main__":
    start_server()
