#!/bin/bash
# Protocol: Sovereign V9 - Total Arsenal Procurement
# Target: Termux/Kali/Linux

echo "[*] INITIATING TOTAL ARSENAL PROCUREMENT..."

# Check environment
IS_TERMUX=false
if [ -d "/data/data/com.termux" ]; then IS_TERMUX=true; fi

# Update & Basic Tooling
if [ "$IS_TERMUX" = true ]; then
    pkg update -y && pkg upgrade -y
    pkg install python git nmap sqlmap nikto build-essential libffi openssl nodejs-lts tor proxychains-ng whois -y
else
    sudo apt-get update -y
    sudo apt-get install python3 python3-pip git nmap sqlmap nikto build-essential libffi-dev libssl-dev nodejs tor proxychains4 whois -y
fi

# Python Dependencies for Fusion Arsenal
pip install --upgrade pip
pip install requests pyyaml pydantic rich prompt_toolkit httpx tenacity jinja2 fire exa-py firecrawl-py parallel-web fal-client edge-tts PyJWT websockets nest-asyncio aiohttp

# GHunt (Google OSINT) Procurement
pip install ghunt

# Go365 (O365 Attack) Procurement
# Usually a Go binary, but we ensure Python-based alternatives/wrappers are ready
pip install o365-enum || echo "[!] o365-enum installation failed, using manual forge."

# ARGUS (Network Flows)
if [ "$IS_TERMUX" = true ]; then
    pkg install argus -y || echo "[!] argus not found in pkg, manual forge required."
else
    sudo apt-get install argus-server argus-client -y
fi

# Searchsploit (Exploit-DB)
if [ "$IS_TERMUX" = true ]; then
    pkg install exploitdb -y
else
    sudo apt-get install exploitdb -y
fi

echo "[✓] ARSENAL PROCUREMENT COMPLETE. ALL INTEGRATED TOOLS ARMED."
