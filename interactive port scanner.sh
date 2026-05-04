import socket
import time

def scan_ports(target_ip, start_port, end_port):
    print(f"\nScanning target: {target_ip}")
    print(f"Scanning ports {start_port} through {end_port}...\n")
    
    start_time = time.time()
    
    for port in range(start_port, end_port + 1):
        # Create a TCP socket
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        s.settimeout(0.5) # Fast timeout for local networks
        
        # Connect to port
        result = s.connect_ex((target_ip, port))
        if result == 0:
            print(f"🔓 Port {port}: OPEN")
        s.close()
        
    end_time = time.time()
    print(f"\nScan completed in {round(end_time - start_time, 2)} seconds.")

if __name__ == "__main__":
    # Change this to your router or machine IP
    target = "192.168.1.1" 
    scan_ports(target, 20, 100)
