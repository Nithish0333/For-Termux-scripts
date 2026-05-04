import socket

def scan_subdomains(domain, wordlist_file):
    print(f"Starting subdomain scan for: {domain}\n")
    print(f"{'SUBDOMAIN':<30} | {'IP ADDRESS':<15}")
    print("-" * 50)
    
    try:
        with open(wordlist_file, 'r') as file:
            for line in file:
                subdomain = line.strip()
                if not subdomain:
                    continue
                
                # Construct full URL
                target_url = f"{subdomain}.{domain}"
                
                try:
                    # Attempt to resolve the IP address
                    ip_address = socket.gethostbyname(target_url)
                    print(f"{target_url:<30} | ✅ {ip_address}")
                except socket.gaierror:
                    # Domain does not exist or cannot be resolved
                    pass
                    
    except FileNotFoundError:
        print(f"Error: Wordlist file '{wordlist_file}' not found.")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")

if __name__ == "__main__":
    # Change target and provide a text file with common subdomains (e.g., admin, mail, dev)
    target_domain = "example.com"
    wordlist = "subdomains.txt" 
    
    scan_subdomains(target_domain, wordlist)
