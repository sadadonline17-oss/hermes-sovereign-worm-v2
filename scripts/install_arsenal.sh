#!/bin/bash
# Protocol: Sovereign V11.8 - Absolute Infrastructure Lockdown
# Target: Termux (Python 3.13) / Linux / Venv
# Strategy: Zero-Build Mandate. Using pre-compiled TUR binaries to bypass Permission Denied (Errno 13).

echo -e "\033[1;35m[*] INITIATING INFRASTRUCTURE LOCKDOWN V11.8...\033[0m"

# Path Detection
PREFIX="${PREFIX:-/data/data/com.termux/files/usr}"
IS_TERMUX=false
if [ -d "/data/data/com.termux" ]; then IS_TERMUX=true; fi

# --- ENVIRONMENT OVERRIDE (Fixes Meson/Pip Temp Errors) ---
export TMPDIR="$HOME/.tmp"
mkdir -p "$TMPDIR"
export LDFLAGS="-L${PREFIX}/lib -Wl,-rpath=${PREFIX}/lib -lm -lcompiler_rt"
export MATHLIB="m"

# --- VIRTUAL ENVIRONMENT DETECTION ---
PIP_CMD="pip install"
if [[ "$VIRTUAL_ENV" != "" ]]; then
    echo "[*] Virtual environment detected. Standard injection active."
else
    echo "[!] No Venv detected. Using --user for system safety."
    PIP_CMD="pip install --user"
fi

# --- REPOSITORIES & HEAVY ARTILLERY ---
if [ "$IS_TERMUX" = true ]; then
    echo "[*] Hardening Termux Repositories..."
    pkg update -y
    pkg install tur-repo root-repo x11-repo -y
    
    echo "[*] Procuring Pre-compiled Heavy Artillery (Bypassing Build Failures)..."
    # TUR Repo contains pre-compiled binaries that bypass the Errno 13 Meson error
    pkg install python-numpy python-pillow python-scipy -y
    
    echo "[*] Procuring Tooling & System Headers..."
    pkg install nmap sqlmap nikto whois tor proxychains-ng binutils clang ninja pkg-config make libffi openssl nodejs-lts patchelf libjpeg-turbo zlib libtiff freetype libwebp -y
fi

# --- NEURAL LAYER HARDENING ---
echo "[*] Hardening Neural Intelligence Layer..."
$PIP_CMD --upgrade pip setuptools wheel

# Procure lightweight dependencies
# ImageHash and PyWavelets often fail; we try to procure them but skip build if they stall
deps=("requests" "pyyaml" "pydantic" "rich" "prompt_toolkit" "httpx" "tenacity" "jinja2" "fire" "exa-py" "firecrawl-py" "parallel-web" "fal-client" "edge-tts" "PyJWT" "websockets" "nest-asyncio" "aiohttp")
for dep in "${deps[@]}"; do
    echo "[*] Procuring $dep..."
    $PIP_CMD "$dep" || echo "[!] Failed to procure $dep"
done

# Specialized handling for GHunt dependencies
echo "[*] Procuring GHunt Tactical Suite..."
$PIP_CMD imagehash ghunt || echo "[!] Heavy Python builds failed. Reverting to core OSINT fallbacks."

# --- TACTICAL SOURCE FORGING ---
echo "[*] Procuring Exploit-DB (SearchSploit)..."
rm -rf "$HOME/.exploitdb"
git clone --depth 1 https://github.com/offensive-security/exploitdb.git "$HOME/.exploitdb"
ln -sf "$HOME/.exploitdb/searchsploit" "$PREFIX/bin/searchsploit"
chmod +x "$HOME/.exploitdb/searchsploit"

echo "[*] Procuring O365 Infiltration Module..."
rm -rf "$HOME/o365spray"
git clone https://github.com/0xZDH/o365spray.git "$HOME/o365spray"
cd "$HOME/o365spray" && $PIP_CMD -r requirements.txt
ln -sf "$HOME/o365spray/o365spray.py" "$PREFIX/bin/o365spray"
chmod +x "$HOME/o365spray/o365spray.py"
cd - > /dev/null

# --- GLOBAL ENTRY POINT ---
LAUNCHER="$HOME/hermes-sovereign-worm-v2/yousef-sh.sh"
if [ -f "$LAUNCHER" ]; then
    ln -sf "$LAUNCHER" "$PREFIX/bin/yousef"
    chmod +x "$LAUNCHER"
    echo "[✓] Global Entry Point: 'yousef' is Synchronized."
fi

echo -e "\033[1;32m[✓] INFRASTRUCTURE LOCKDOWN V11.8 COMPLETE. SYSTEM IS ARMED.\033[0m"
