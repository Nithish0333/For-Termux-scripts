import zipfile
import time

def extract_zip(zip_path, password):
    try:
        with zipfile.ZipFile(zip_path) as z_file:
            # zipfile requires passwords to be in bytes
            z_file.extractall(pwd=bytes(password, 'utf-8'))
            return True
    except (RuntimeError, zipfile.BadZipFile, zlib.error):
        # Triggered by an incorrect password or corrupt archive
        return False

def brute_force(zip_path, wordlist_path):
    print(f"Attempting to crack {zip_path}...")
    start_time = time.time()
    
    try:
        with open(wordlist_path, 'r', encoding='utf-8', errors='ignore') as f:
            for line in f:
                password = line.strip()
                if extract_zip(zip_path, password):
                    elapsed = round(time.time() - start_time, 2)
                    print(f"\n🔓 Success! Password found: {password}")
                    print(f"Cracked in {elapsed} seconds.")
                    return
                
        print("\n❌ Password not found in the provided wordlist.")
        
    except FileNotFoundError as e:
        print(f"File Error: {e}")

if __name__ == "__main__":
    # Ensure you create these files or update paths before running!
    zip_file_path = "protected.zip"
    wordlist_file_path = "passwords.txt" 
    
    brute_force(zip_file_path, wordlist_file_path)
