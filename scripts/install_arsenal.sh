#!/bin/bash
# Protocol: Sovereign V11.5 - Absolute Environment Mastery
# Target: Termux (Python 3.13) / Linux / Venv

echo -e "\033[1;35m[*] INITIATING ENVIRONMENT-AWARE PROCUREMENT V11.5...\033[0m"

# Path Detection
PREFIX="${PREFIX:-/data/data/com.termux/files/usr}"
IS_TERMUX=false
if [ -d "/data/data/com.termux" ]; then IS_TERMUX=true; fi

# --- VIRTUAL ENVIRONMENT DETECTION ---
PIP_CMD="pip install"
if [[ "$VIRTUAL_ENV" != "" ]] || [[ "$CONDA_PREFIX" != "" ]]; then
    echo "[*] Virtual environment detected. Standard installation enabled."
else
    echo "[!] No Venv detected. Using --user for system-level safety."
    PIP_CMD="pip install --user"
fi

# --- REPOSITORIES & BASE TOOLING ---
if [ "$IS_TERMUX" = true ]; then
    pkg update -y
    pkg install tur-repo root-repo x11-repo -y
    pkg install nmap sqlmap nikto whois tor proxychains-ng binutils clang make libffi openssl nodejs-lts patchelf -y
    
    echo "[*] Procuring Exploit-DB (SearchSploit)..."
    pkg install exploitdb -y || {
        echo "[!] Exploit-DB missing in pkg. Forging Tactical Link..."
        if [ ! -d "$HOME/.exploitdb" ]; then
            git clone --depth 1 https://github.com/offensive-security/exploitdb.git $HOME/.exploitdb
        fi
        ln -sf $HOME/.exploitdb/searchsploit $PREFIX/bin/searchsploit
    }

    echo "[*] Procuring Argus (Network Flows)..."
    pkg install argus argus-clients -y || echo "[!] Argus missing. Using combat fallbacks."
    pkg install python-numpy python-pillow -y
fi

# --- NEURAL LAYER HARDENING ---
echo "[*] Hardening Neural Intelligence Layer..."
$PIP_CMD --upgrade pip
export MATHLIB="m"
export LDFLAGS="-lm -lcompiler_rt"

deps=("requests" "pyyaml" "pydantic" "rich" "prompt_toolkit" "httpx" "tenacity" "jinja2" "fire" "exa-py" "firecrawl-py" "parallel-web" "fal-client" "edge-tts" "PyJWT" "websockets" "nest-asyncio" "aiohttp" "imagehash" "ghunt")
for dep in "${deps[@]}"; do
    echo "[*] Procuring $dep..."
    $PIP_CMD "$dep" || echo "[!] Failed to procure $dep"
done

# --- OFFENSIVE PROCUREMENT ---
echo "[*] Procuring O365 Infiltration Module..."
$PIP_CMD o365spray || {
    echo "[!] o365spray not in PyPI. Cloning Tactical Source..."
    if [ ! -d "$HOME/o365spray" ]; then
        git clone https://github.com/0xZDH/o365spray.git $HOME/o365spray
    fi
    cd $HOME/o365spray && $PIP_CMD -r requirements.txt
}

# --- GLOBAL ENTRY POINT ---
LAUNCHER="$HOME/hermes-sovereign-worm-v2/yousef-sh.sh"
if [ -f "$LAUNCHER" ]; then
    ln -sf "$LAUNCHER" "$PREFIX/bin/yousef"
    chmod +x "$LAUNCHER"
    echo "[✓] Global Entry Point: 'yousef' is Synchronized."
fi

echo -e "\033[1;32m[✓] SOVEREIGN PROCUREMENT V11.5 COMPLETE. PREDATOR ACTIVE.\033[0m"
