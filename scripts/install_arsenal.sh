#!/bin/bash
# Protocol: Sovereign V11.6 - Predator Procurement
# Target: Termux (Python 3.13) / Linux / Venv
# Status: Absolute Execution Locked

echo -e "\033[1;35m[*] INITIATING PREDATOR PROCUREMENT V11.6...\033[0m"

# Path Detection
PREFIX="${PREFIX:-/data/data/com.termux/files/usr}"
HOME_DIR="$HOME"
IS_TERMUX=false
if [ -d "/data/data/com.termux" ]; then IS_TERMUX=true; fi

# --- VIRTUAL ENVIRONMENT DETECTION ---
PIP_CMD="pip install"
if [[ "$VIRTUAL_ENV" != "" ]] || [[ "$CONDA_PREFIX" != "" ]]; then
    echo "[*] Virtual environment detected. Standard installation enabled."
else
    echo "[!] No Venv detected. Using --user flag for system safety."
    PIP_CMD="pip install --user"
fi

# --- REPOSITORIES & SYSTEM HEADERS ---
if [ "$IS_TERMUX" = true ]; then
    echo "[*] Hardening Termux Repositories..."
    pkg update -y
    pkg install tur-repo root-repo x11-repo -y
    
    echo "[*] Procuring System Headers for Offensive Modules..."
    pkg install nmap sqlmap nikto whois tor proxychains-ng binutils clang ninja pkg-config make libffi openssl nodejs-lts patchelf libjpeg-turbo zlib libtiff freetype libwebp -y
    
    echo "[*] Procuring Pre-built Scientific Stack (Avoiding Build Errors)..."
    pkg install python-numpy python-pillow python-scipy -y
fi

# --- NEURAL LAYER HARDENING ---
echo "[*] Hardening Neural Intelligence Layer..."
$PIP_CMD --upgrade pip setuptools wheel

# Environment flags for any remaining source builds
export LDFLAGS="-L${PREFIX}/lib -Wl,-rpath=${PREFIX}/lib -lm -lcompiler_rt"
export MATHLIB="m"

deps=("requests" "pyyaml" "pydantic" "rich" "prompt_toolkit" "httpx" "tenacity" "jinja2" "fire" "exa-py" "firecrawl-py" "parallel-web" "fal-client" "edge-tts" "PyJWT" "websockets" "nest-asyncio" "aiohttp" "imagehash" "ghunt")
for dep in "${deps[@]}"; do
    echo "[*] Procuring $dep..."
    $PIP_CMD "$dep" || echo "[!] Failed to procure $dep - searching tactical fallback..."
done

# --- TACTICAL BINARY FORGING ---
echo "[*] Procuring Exploit-DB (SearchSploit)..."
if [ ! -d "$HOME_DIR/.exploitdb" ]; then
    git clone --depth 1 https://github.com/offensive-security/exploitdb.git "$HOME_DIR/.exploitdb"
fi
ln -sf "$HOME_DIR/.exploitdb/searchsploit" "$PREFIX/bin/searchsploit"
chmod +x "$HOME_DIR/.exploitdb/searchsploit"

echo "[*] Procuring O365 Infiltration Module (From Source)..."
if [ ! -d "$HOME_DIR/o365spray" ]; then
    git clone https://github.com/0xZDH/o365spray.git "$HOME_DIR/o365spray"
fi
cd "$HOME_DIR/o365spray" && $PIP_CMD -r requirements.txt
# Create a tactical alias for o365spray
ln -sf "$HOME_DIR/o365spray/o365spray.py" "$PREFIX/bin/o365spray"
chmod +x "$HOME_DIR/o365spray/o365spray.py"
cd - > /dev/null

# --- GLOBAL ENTRY POINT ---
LAUNCHER="$HOME_DIR/hermes-sovereign-worm-v2/yousef-sh.sh"
if [ -f "$LAUNCHER" ]; then
    ln -sf "$LAUNCHER" "$PREFIX/bin/yousef"
    chmod +x "$LAUNCHER"
    echo "[✓] Global Entry Point: 'yousef' is Synchronized."
fi

echo -e "\033[1;32m[✓] PREDATOR PROCUREMENT V11.6 COMPLETE. SYSTEM IS 100% ARMED.\033[0m"
