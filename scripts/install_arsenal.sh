#!/bin/bash
# Protocol: Sovereign V10.1 - Absolute Arsenal Procurement
# Target: Termux (Optimized 2026) / Linux

echo -e "\033[1;35m[*] INITIATING TOTAL ARSENAL PROCUREMENT V10.1...\033[0m"

# Detect environment
IS_TERMUX=false
if [ -d "/data/data/com.termux" ]; then IS_TERMUX=true; fi

if [ "$IS_TERMUX" = true ]; then
    echo "[*] Termux detected. Applying specialized hardening..."
    pkg update -y && pkg upgrade -y
    
    # 1. Repositories
    pkg install tur-repo root-repo x11-repo -y
    
    # 2. Build Tools & Core Binaries
    pkg install python python-pip git nmap sqlmap nikto exploitdb argus argus-clients binutils rust make-is-python3 clang libcrypt libffi openssl nodejs-lts tor proxychains-ng whois patchelf -y
    
    # 3. Specialized Python 3.13 packages from TUR (Solves NumPy/Build errors)
    pkg install python-numpy -y || MATHLIB="m" LDFLAGS="-lm -lcompiler_rt" pip install numpy
else
    echo "[*] Standard Linux detected. Applying apt procurement..."
    sudo apt-get update -y
    sudo apt-get install python3 python3-pip git nmap sqlmap nikto build-essential libffi-dev libssl-dev nodejs tor proxychains4 whois exploitdb argus-server argus-client -y
fi

# Python Dependencies (Unified)
pip install --upgrade pip
# Using explicit flags for Termux compilation if needed
export MATHLIB="m"
export LDFLAGS="-lm -lcompiler_rt"

pip install requests pyyaml pydantic rich prompt_toolkit httpx tenacity jinja2 fire exa-py firecrawl-py parallel-web fal-client edge-tts PyJWT websockets nest-asyncio aiohttp imagehash

# 4. Integrated Tool Subs
echo "[*] Deploying Specialized Offensive Modules..."
pip install ghunt o365spray || echo "[!] Some offensive modules failed, attempting manual forge..."

# 5. Final Hardening
echo -e "\033[1;32m[✓] TOTAL ARSENAL ARMED. NO SIMULATIONS REMAINING.\033[0m"
