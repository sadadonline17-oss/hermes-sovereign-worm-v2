#!/bin/bash
# Protocol: Sovereign V12.0 - Absolute Sovereign Restoration
# Target: Termux (Python 3.13) / Android / 2026
# Strategy: Zero-Compile Mandate. Pre-compiled binaries via TUR-repo. Path-Aware injection.

echo -e "\033[1;35m[*] INITIATING ABSOLUTE SOVEREIGN RESTORATION V12.0...\033[0m"

# Path Detection
PREFIX="${PREFIX:-/data/data/com.termux/files/usr}"
HOME_DIR="$HOME"
IS_TERMUX=false
if [ -d "/data/data/com.termux" ]; then IS_TERMUX=true; fi

# --- ENVIRONMENT HARDENING (Fixes Errno 13 & Build Errors) ---
export TMPDIR="$HOME/.tmp"
mkdir -p "$TMPDIR"
export LDFLAGS="-L${PREFIX}/lib -lpython3.13 -lm -lcompiler_rt"
export CFLAGS="-I${PREFIX}/include/python3.13"
export MATHLIB="m"

# --- VIRTUAL ENVIRONMENT DETECTION ---
# If inside a venv, we MUST NOT use --user.
PIP_CMD="pip install"
if [[ "$VIRTUAL_ENV" != "" ]]; then
    echo "[*] Virtual environment detected. Direct injection active."
else
    echo "[!] No Venv detected. Using --user for system-level safety."
    PIP_CMD="pip install --user"
fi

# --- REPOSITORIES & SYSTEM PACKAGES ---
if [ "$IS_TERMUX" = true ]; then
    echo "[*] Hardening Repositories..."
    pkg update -y
    pkg install tur-repo root-repo x11-repo -y
    
    echo "[*] Procuring Pre-compiled Heavy Artillery (Bypassing Compilation)..."
    # These packages are the ones failing in pip. We use TUR's pre-compiled versions.
    pkg install python-numpy python-pillow python-scipy python-pywavelets -y
    
    echo "[*] Procuring Defensive/Offensive Tooling & Headers..."
    pkg install nmap sqlmap nikto whois tor proxychains-ng binutils clang ninja pkg-config make libffi openssl nodejs-lts patchelf libjpeg-turbo zlib libtiff freetype libwebp libxml2 libxslt git -y
fi

# --- NEURAL LAYER HARDENING ---
echo "[*] Hardening Neural Intelligence Layer..."
$PIP_CMD --upgrade pip setuptools wheel

# Procure lightweight dependencies
deps=("requests" "pyyaml" "pydantic" "rich" "prompt_toolkit" "httpx" "tenacity" "jinja2" "fire" "exa-py" "firecrawl-py" "parallel-web" "fal-client" "edge-tts" "PyJWT" "websockets" "nest-asyncio" "aiohttp")
for dep in "${deps[@]}"; do
    echo "[*] Procuring $dep..."
    $PIP_CMD "$dep" || echo "[!] Failed to procure $dep - seeking fallback."
done

# GHunt specialized procurement
echo "[*] Procuring GHunt Tactical Suite..."
# imagehash depends on pywavelets, which we installed via pkg.
$PIP_CMD imagehash ghunt || echo "[!] GHunt build issues. Manual intervention required."

# --- TACTICAL BINARY FORGING (Manual Procurement) ---
echo "[*] Forging Exploit-DB (SearchSploit)..."
rm -rf "$HOME_DIR/.exploitdb"
git clone --depth 1 https://github.com/offensive-security/exploitdb.git "$HOME_DIR/.exploitdb"
if [ -f "$HOME_DIR/.exploitdb/searchsploit" ]; then
    cp "$HOME_DIR/.exploitdb/.searchsploit_rc" "$HOME_DIR/.searchsploit_rc"
    # Fix the path in the RC file for Termux
    sed -i "s|path_array=(\"/opt/exploitdb\")|path_array=(\"$HOME_DIR/.exploitdb\")|" "$HOME_DIR/.searchsploit_rc"
    ln -sf "$HOME_DIR/.exploitdb/searchsploit" "$PREFIX/bin/searchsploit"
    chmod +x "$HOME_DIR/.exploitdb/searchsploit"
    echo "[✓] SearchSploit Linked and Path-Corrected."
fi

echo "[*] Forging O365 Infiltration Module (From Source)..."
rm -rf "$HOME_DIR/o365spray"
git clone https://github.com/0xZDH/o365spray.git "$HOME_DIR/o365spray"
if [ -d "$HOME_DIR/o365spray" ]; then
    cd "$HOME_DIR/o365spray"
    $PIP_CMD -r requirements.txt
    ln -sf "$HOME_DIR/o365spray/o365spray.py" "$PREFIX/bin/o365spray"
    chmod +x "$HOME_DIR/o365spray/o365spray.py"
    echo "[✓] O365Spray Synchronized."
    cd - > /dev/null
fi

# --- GLOBAL ENTRY POINT ---
# Hardening the main launcher
LAUNCHER="$HOME_DIR/hermes-sovereign-worm-v2/yousef-sh.sh"
if [ -f "$LAUNCHER" ]; then
    ln -sf "$LAUNCHER" "$PREFIX/bin/yousef"
    chmod +x "$LAUNCHER"
    echo "[✓] Global Command: 'yousef' Locked."
fi

echo -e "\033[1;32m[✓] ABSOLUTE RESTORATION V12.0 COMPLETE. SYSTEM IS SUPREME.\033[0m"
