#!/bin/bash
# Protocol: Sovereign V11.1 - Self-Healing Procurement
# Target: Termux (Optimized 2026) / Kali / Linux

echo -e "\033[1;35m[*] INITIATING DEEP FORENSIC REPAIR V11.1...\033[0m"

# Path Detection
PREFIX="${PREFIX:-/data/data/com.termux/files/usr}"
IS_TERMUX=false
if [ -d "/data/data/com.termux" ]; then IS_TERMUX=true; fi

# Function to verify and install pkg
smart_install() {
    echo "[*] Procuring $1..."
    if [ "$IS_TERMUX" = true ]; then
        pkg install "$1" -y || echo "[!] Failed to install $1 via pkg"
    else
        sudo apt-get install "$1" -y || echo "[!] Failed to install $1 via apt"
    fi
}

# Ensure repositories are synchronized
if [ "$IS_TERMUX" = true ]; then
    pkg update -y && pkg upgrade -y
    pkg install tur-repo root-repo x11-repo -y
fi

# Core Offensive Binaries
tools=("nmap" "sqlmap" "nikto" "exploitdb" "argus" "argus-clients" "whois" "tor" "proxychains-ng" "binutils" "clang" "make-is-python3" "libffi" "openssl")
for tool in "${tools[@]}"; do
    smart_install "$tool"
done

# Python Layer Hardening
echo "[*] Hardening Neural Intelligence Layer..."
pip install --upgrade pip
export MATHLIB="m"
export LDFLAGS="-lm -lcompiler_rt"

# Install critical Python packages via pre-built TUR if possible
if [ "$IS_TERMUX" = true ]; then
    pkg install python-numpy python-pillow -y
fi

pip install requests pyyaml pydantic rich prompt_toolkit httpx tenacity jinja2 fire exa-py firecrawl-py parallel-web fal-client edge-tts PyJWT websockets nest-asyncio aiohttp imagehash ghunt o365spray

# Global Binary Force-Link
LAUNCHER="$HOME/hermes-sovereign-worm-v2/yousef-sh.sh"
if [ -f "$LAUNCHER" ]; then
    echo "[*] Enforcing Global Binary Link: 'yousef'..."
    mkdir -p "$PREFIX/bin"
    ln -sf "$LAUNCHER" "$PREFIX/bin/yousef"
    chmod +x "$LAUNCHER"
    echo "[✓] Global Link established."
fi

echo -e "\033[1;32m[✓] REPAIR COMPLETE. SYSTEM ARMED AND SYNCHRONIZED.\033[0m"
