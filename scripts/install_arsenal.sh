#!/bin/bash
# Protocol: Sovereign V12.1 - Absolute Infrastructure Supremacy
# Target: Termux (Python 3.13) / Android / 2026
# Strategy: Force pre-compiled TUR binaries. Harden SearchSploit/O365Spray procurement.

echo -e "\033[1;35m[*] INITIATING INFRASTRUCTURE SUPREMACY V12.1...\033[0m"

# Path Detection
PREFIX="${PREFIX:-/data/data/com.termux/files/usr}"
HOME_DIR="$HOME"
IS_TERMUX=false
if [ -d "/data/data/com.termux" ]; then IS_TERMUX=true; fi

# --- ENVIRONMENT OVERRIDE ---
export TMPDIR="$HOME/.tmp"
mkdir -p "$TMPDIR"
export LDFLAGS="-L${PREFIX}/lib -lpython3.13 -lm -lcompiler_rt"
export CFLAGS="-I${PREFIX}/include/python3.13"

# --- VIRTUAL ENVIRONMENT DETECTION ---
PIP_CMD="pip install"
if [[ "$VIRTUAL_ENV" != "" ]]; then
    echo "[*] Virtual environment detected. Standard injection enabled."
else
    echo "[!] No Venv detected. Using --user for system safety."
    PIP_CMD="pip install --user"
fi

# --- REPOSITORIES & PRE-COMPILED ARTILLERY ---
if [ "$IS_TERMUX" = true ]; then
    echo "[*] Hardening Repositories..."
    pkg update -y
    pkg install tur-repo root-repo x11-repo -y
    
    echo "[*] Procuring Pre-compiled Heavy Artillery (Zero-Compile Mandate)..."
    # These bypass the Errno 13 Meson compile error
    pkg install python-numpy python-pillow python-scipy python-pywavelets -y
    
    echo "[*] Procuring System Headers & Core Tooling..."
    pkg install nmap sqlmap nikto whois tor proxychains-ng binutils clang ninja pkg-config make libffi openssl nodejs-lts patchelf libjpeg-turbo zlib libtiff freetype libwebp libxml2 libxslt git -y
fi

# --- NEURAL LAYER HARDENING ---
echo "[*] Hardening Neural Intelligence Layer..."
$PIP_CMD --upgrade pip setuptools wheel

# Lightweight dependencies
deps=("requests" "pyyaml" "pydantic" "rich" "prompt_toolkit" "httpx" "tenacity" "jinja2" "fire" "exa-py" "firecrawl-py" "parallel-web" "fal-client" "edge-tts" "PyJWT" "websockets" "nest-asyncio" "aiohttp")
for dep in "${deps[@]}"; do
    echo "[*] Procuring $dep..."
    $PIP_CMD "$dep" || echo "[!] Failed to procure $dep"
done

# specialized handling for imagehash/ghunt
echo "[*] Procuring GHunt Tactical Suite..."
# Since python-pywavelets is installed via pkg, imagehash build should now succeed or find it.
$PIP_CMD imagehash ghunt || echo "[!] imagehash/ghunt build failed. Reverting to core OSINT."

# --- TACTICAL BINARY FORGING (HARDENED) ---
echo "[*] Forging Exploit-DB (SearchSploit)..."
rm -rf "$HOME_DIR/.exploitdb"
git clone --depth 1 https://github.com/offensive-security/exploitdb.git "$HOME_DIR/.exploitdb"
if [ -f "$HOME_DIR/.exploitdb/searchsploit" ]; then
    cp "$HOME_DIR/.exploitdb/.searchsploit_rc" "$HOME_DIR/.searchsploit_rc"
    sed -i "s|path_array=(\"/opt/exploitdb\")|path_array=(\"$HOME_DIR/.exploitdb\")|" "$HOME_DIR/.searchsploit_rc"
    ln -sf "$HOME_DIR/.exploitdb/searchsploit" "$PREFIX/bin/searchsploit"
    chmod +x "$HOME_DIR/.exploitdb/searchsploit"
    echo "[✓] SearchSploit Established."
fi

echo "[*] Forging O365 Infiltration Module..."
rm -rf "$HOME_DIR/o365spray"
git clone https://github.com/0xZDH/o365spray.git "$HOME_DIR/o365spray"
if [ -d "$HOME_DIR/o365spray" ]; then
    cd "$HOME_DIR/o365spray"
    $PIP_CMD -r requirements.txt
    ln -sf "$HOME_DIR/o365spray/o365spray.py" "$PREFIX/bin/o365spray"
    chmod +x "$HOME_DIR/o365spray/o365spray.py"
    echo "[✓] O365Spray Established."
    cd - > /dev/null
fi

# --- GLOBAL ENTRY POINT ---
LAUNCHER="$HOME_DIR/hermes-sovereign-worm-v2/yousef-sh.sh"
if [ -f "$LAUNCHER" ]; then
    ln -sf "$LAUNCHER" "$PREFIX/bin/yousef"
    chmod +x "$LAUNCHER"
    echo "[✓] Global Entry Point: 'yousef' is Synchronized."
fi

echo -e "\033[1;32m[✓] INFRASTRUCTURE SUPREMACY V12.1 COMPLETE. SYSTEM LIVE.\033[0m"
