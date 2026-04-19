#!/bin/bash
# Protocol: Sovereign V11.7 - Absolute Environment Synchronization
# Target: Termux (Python 3.13) / Linux / Venv
# Strategy: Pre-compiled binaries via TUR-repo to bypass build failures.

echo -e "\033[1;35m[*] INITIATING ENVIRONMENT SYNCHRONIZATION V11.7...\033[0m"

# Path Detection
PREFIX="${PREFIX:-/data/data/com.termux/files/usr}"
IS_TERMUX=false
if [ -d "/data/data/com.termux" ]; then IS_TERMUX=true; fi

# --- VIRTUAL ENVIRONMENT DETECTION ---
# If inside a venv, we MUST NOT use --user.
PIP_CMD="pip install"
if [[ "$VIRTUAL_ENV" != "" ]]; then
    echo "[*] Virtual environment detected. Disabling --user flag for direct injection."
else
    echo "[!] No Venv detected. Using --user for system-level safety."
    PIP_CMD="pip install --user"
fi

# --- REPOSITORIES & SYSTEM HEADERS ---
if [ "$IS_TERMUX" = true ]; then
    echo "[*] Hardening Termux Repositories..."
    pkg update -y
    pkg install tur-repo root-repo x11-repo -y
    
    echo "[*] Procuring Pre-built Heavy Artillery (No-Build Strategy)..."
    # These packages fail when built via pip in Termux. We install them pre-compiled.
    pkg install python-numpy python-pillow python-scipy -y
    
    echo "[*] Procuring Offensive Tooling & Headers..."
    pkg install nmap sqlmap nikto whois tor proxychains-ng binutils clang ninja pkg-config make libffi openssl nodejs-lts patchelf libjpeg-turbo zlib libtiff freetype libwebp -y
fi

# --- NEURAL LAYER HARDENING ---
echo "[*] Hardening Neural Intelligence Layer..."
$PIP_CMD --upgrade pip setuptools wheel

# Environment flags for any remaining lightweight source builds
export LDFLAGS="-L${PREFIX}/lib -Wl,-rpath=${PREFIX}/lib -lm -lcompiler_rt"
export MATHLIB="m"

# Procure lightweight dependencies
deps=("requests" "pyyaml" "pydantic" "rich" "prompt_toolkit" "httpx" "tenacity" "jinja2" "fire" "exa-py" "firecrawl-py" "parallel-web" "fal-client" "edge-tts" "PyJWT" "websockets" "nest-asyncio" "aiohttp" "imagehash" "ghunt")
for dep in "${deps[@]}"; do
    echo "[*] Procuring $dep..."
    $PIP_CMD "$dep" || echo "[!] Failed to procure $dep - seeking fallback."
done

# --- TACTICAL SOURCE CLONING ---
echo "[*] Procuring Exploit-DB (SearchSploit)..."
if [ ! -d "$HOME/.exploitdb" ]; then
    git clone --depth 1 https://github.com/offensive-security/exploitdb.git "$HOME/.exploitdb"
fi
ln -sf "$HOME/.exploitdb/searchsploit" "$PREFIX/bin/searchsploit"
chmod +x "$HOME/.exploitdb/searchsploit"

echo "[*] Procuring O365 Infiltration Module (Tactical Source)..."
if [ ! -d "$HOME/o365spray" ]; then
    git clone https://github.com/0xZDH/o365spray.git "$HOME/o365spray"
fi
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

echo -e "\033[1;32m[✓] ENVIRONMENT SYNCHRONIZATION V11.7 COMPLETE. SYSTEM LIVE.\033[0m"
