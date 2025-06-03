# El-Escaneador
It's a script that uses the power of subfinder and HTTPS to collect active subdomains. It doesn't require any APIs or heavy-duty programs.

# Subdomains + HTTPX Checker (Bash Script)

This script automates the discovery and validation of subdomains for a target domain using `subfinder` and `httpx`.

### 🚀 Features

- Discover subdomains using `subfinder`
- Check if subdomains are responding (status 200) using `httpx`
- Color the output green or red depending on the response

### 📦 Requirements

- `subfinder` (https://github.com/projectdiscovery/subfinder)
- `httpx` (https://github.com/projectdiscovery/httpx)
- Bash

### 🧪 Usage Example

```bash
chmod +x subdomains.sh
./subdomains.sh example.com

### Information:----------------------------------------------------------------
-By-MCF
-This project is a simple, educational version. I have more advanced versions in development that have not been published yet.
-First own project in bash oriented to bug bounty.
-This script is in early development
