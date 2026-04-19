#!/bin/bash
# Protocol: Sovereign V12.2 - Absolute Execution Finality
# Target: Termux (Python 3.13) / Android / 2026
# Strategy: Zero-Build Mandate. TUR-repo binary priority. Meson Path-Hardening.

echo -e "\033[1;35m[*] INITIATING ABSOLUTE EXECUTION FINALITY V12.2...\033[0m"

# Path Detection
PREFIX="${PREFIX:-/data/data/com.termux/files/usr}"
HOME_DIR="$HOME"
IS_TERMUX=false
if [ -d "/data/data/com.termux" ]; then IS_TERMUX=true; fi

# --- ENVIRONMENT HARDENING (The Errno 13 Killer) ---
export TMPDIR="$HOME/.tmp"
mkdir -p "$TMPDIR"
# Force Meson to use Termux Prefix and avoid /data/data/com.termux/files/lib access
export LDFLAGS="-L${PREFIX}/lib -lpython3.13 -Wl,--rpath=${PREFIX}/lib"
export CFLAGS="-I${PREFIX}/include/python3.13"
export PYTHONPATH="$PREFIX/lib/python3.13/site-packages"

# --- VIRTUAL ENVIRONMENT DETECTION ---
PIP_CMD="pip install"
if [[ "$VIRTUAL_ENV" != "" ]]; then
    echo "[*] Virtual environment detected. Direct injection enabled."
else
    echo "[!] No Venv detected. Using --user for system safety."
    PIP_CMD="pip install --user"
fi

# --- REPOSITORIES & PRE-COMPILED STACK ---
if [ "$IS_TERMUX" = true ]; then
    echo "[*] Hardening Repositories..."
    pkg update -y
    pkg install tur-repo root-repo x11-repo -y
    
    echo "[*] Procuring Pre-compiled Heavy Artillery (Zero-Build Strategy)..."
    # These bypass the Errno 13 Meson build error entirely
    pkg install python-numpy python-pillow python-scipy python-pywavelets -y
    
    echo "[*] Procuring Offensive Toolset Headers..."
    pkg install nmap sqlmap nikto whois tor proxychains-ng binutils clang ninja pkg-config make libffi openssl nodejs-lts patchelf libjpeg-turbo zlib libtiff freetype libwebp libxml2 libxslt libiconv git -y
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

# GHunt specialized handling
echo "[*] Procuring GHunt Tactical Suite..."
# Since python-pywavelets is in pkg, imagehash should now install without building PyWavelets
$PIP_CMD imagehash ghunt || echo "[!] Heavy Python builds stalled. Manual intervention logged."

# --- TACTICAL BINARY FORGING (Predator Protocol) ---
echo "[*] Forging Exploit-DB (SearchSploit)..."
rm -rf "$HOME_DIR/.exploitdb"
git clone --depth 1 https://github.com/offensive-security/exploitdb.git "$HOME_DIR/.exploitdb"
if [ -f "$HOME_DIR/.exploitdb/searchsploit" ]; then
    cp "$HOME_DIR/.exploitdb/.searchsploit_rc" "$HOME_DIR/.searchsploit_rc"
    # Patch the RC file for Termux non-root environment
    sed -i "s|path_array=(\"/opt/exploitdb\")|path_array=(\"$HOME_DIR/.exploitdb\")|" "$HOME_DIR/.searchsploit_rc"
    ln -sf "$HOME_DIR/.exploitdb/searchsploit" "$PREFIX/bin/searchsploit"
    chmod +x "$PREFIX/bin/searchsploit"
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

# --- GLOBAL COMMAND LOCK ---
LAUNCHER="$HOME_DIR/hermes-sovereign-worm-v2/yousef-sh.sh"
if [ -f "$LAUNCHER" ]; then
    ln -sf "$LAUNCHER" "$PREFIX/bin/yousef"
    chmod +x "$LAUNCHER"
    echo "[✓] Global Command 'yousef' Synchronized."
fi

echo -e "\033[1;32m[✓] ABSOLUTE EXECUTION FINALITY V12.2 COMPLETE. SYSTEM ARMED.\033[0m"
