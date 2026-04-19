#!/bin/bash
# Protocol: Sovereign V11.9 - Absolute Environment Finality
# Target: Termux (Python 3.13) / Linux / Venv
# Strategy: Zero-Compile Mandate. Using pre-compiled TUR binaries.

echo -e "\033[1;35m[*] INITIATING ENVIRONMENT FINALITY V11.9...\033[0m"

# Path Detection
PREFIX="${PREFIX:-/data/data/com.termux/files/usr}"
IS_TERMUX=false
if [ -d "/data/data/com.termux" ]; then IS_TERMUX=true; fi

# --- ENVIRONMENT OVERRIDE ---
export TMPDIR="$HOME/.tmp"
mkdir -p "$TMPDIR"

# --- VIRTUAL ENVIRONMENT DETECTION ---
PIP_CMD="pip install"
if [[ "$VIRTUAL_ENV" != "" ]]; then
    echo "[*] Virtual environment detected. Direct injection active."
else
    echo "[!] No Venv detected. Using --user for system safety."
    PIP_CMD="pip install --user"
fi

# --- REPOSITORIES & PRE-COMPILED ARTILLERY ---
if [ "$IS_TERMUX" = true ]; then
    echo "[*] Hardening Termux Repositories..."
    pkg update -y
    pkg install tur-repo root-repo x11-repo -y
    
    echo "[*] Procuring Pre-compiled Heavy Artillery (Bypassing Compile Errors)..."
    # These bypass the Errno 13 Meson compile error
    pkg install python-numpy python-pillow python-scipy -y
    
    echo "[*] Procuring Tooling & System Headers..."
    pkg install nmap sqlmap nikto whois tor proxychains-ng binutils clang ninja pkg-config make libffi openssl nodejs-lts patchelf libjpeg-turbo zlib libtiff freetype libwebp -y
fi

# --- NEURAL LAYER HARDENING ---
echo "[*] Hardening Neural Intelligence Layer..."
$PIP_CMD --upgrade pip setuptools wheel

# Install lightweight dependencies
deps=("requests" "pyyaml" "pydantic" "rich" "prompt_toolkit" "httpx" "tenacity" "jinja2" "fire" "exa-py" "firecrawl-py" "parallel-web" "fal-client" "edge-tts" "PyJWT" "websockets" "nest-asyncio" "aiohttp")
for dep in "${deps[@]}"; do
    echo "[*] Procuring $dep..."
    $PIP_CMD "$dep" || echo "[!] Failed to procure $dep"
done

# --- TACTICAL BINARY PROCUREMENT (HARDENED) ---
echo "[*] Procuring Exploit-DB (SearchSploit)..."
rm -rf "$HOME/.exploitdb"
# Use a more reliable clone for SearchSploit utility
git clone --depth 1 https://github.com/offensive-security/exploitdb.git "$HOME/.exploitdb"
if [ -f "$HOME/.exploitdb/searchsploit" ]; then
    ln -sf "$HOME/.exploitdb/searchsploit" "$PREFIX/bin/searchsploit"
    chmod +x "$PREFIX/bin/searchsploit"
    echo "[✓] SearchSploit Linked."
else
    echo "[!] SearchSploit utility not found in clone."
fi

echo "[*] Procuring O365 Infiltration Module..."
rm -rf "$HOME/o365spray"
git clone https://github.com/0xZDH/o365spray.git "$HOME/o365spray"
if [ -d "$HOME/o365spray" ]; then
    cd "$HOME/o365spray"
    $PIP_CMD -r requirements.txt
    ln -sf "$HOME/o365spray/o365spray.py" "$PREFIX/bin/o365spray"
    chmod +x "$HOME/o365spray/o365spray.py"
    echo "[✓] O365Spray Linked."
    cd - > /dev/null
fi

# --- GLOBAL ENTRY POINT ---
LAUNCHER="$HOME/hermes-sovereign-worm-v2/yousef-sh.sh"
if [ -f "$LAUNCHER" ]; then
    ln -sf "$LAUNCHER" "$PREFIX/bin/yousef"
    chmod +x "$LAUNCHER"
    echo "[✓] Global Entry Point: 'yousef' is Synchronized."
fi

echo -e "\033[1;32m[✓] ENVIRONMENT FINALITY V11.9 COMPLETE. SYSTEM IS ARMED.\033[0m"
