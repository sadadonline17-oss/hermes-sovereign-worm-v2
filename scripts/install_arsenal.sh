#!/bin/bash
# Protocol: Sovereign V11.4 - Venv Optimized Procurement
# Target: Termux (Python 3.13) / Linux

echo -e "\033[1;35m[*] INITIATING VENV-OPTIMIZED PROCUREMENT V11.4...\033[0m"

# Path Detection
PREFIX="${PREFIX:-/data/data/com.termux/files/usr}"
IS_TERMUX=false
if [ -d "/data/data/com.termux" ]; then IS_TERMUX=true; fi

# Detect if inside a virtualenv
PIP_FLAGS=""
if [[ "$VIRTUAL_ENV" != "" ]]; then
    echo "[*] Virtual environment detected. Disabling --user flag."
    PIP_FLAGS=""
else
    echo "[!] No Venv detected. Using --user for safety."
    PIP_FLAGS="--user"
fi

# Repositories & Base Tooling
if [ "$IS_TERMUX" = true ]; then
    pkg update -y
    pkg install tur-repo root-repo x11-repo -y
    pkg install nmap sqlmap nikto whois tor proxychains-ng binutils clang make libffi openssl nodejs-lts patchelf -y
    
    echo "[*] Procuring Exploit-DB (SearchSploit)..."
    pkg install exploitdb -y || {
        echo "[!] Exploit-DB missing in pkg. Cloning manually..."
        rm -rf $HOME/.exploitdb
        git clone --depth 1 https://github.com/offensive-security/exploitdb.git $HOME/.exploitdb
        ln -sf $HOME/.exploitdb/searchsploit $PREFIX/bin/searchsploit
    }

    echo "[*] Procuring Argus (Network Flows)..."
    pkg install argus argus-clients -y || echo "[!] Argus missing. Using fallbacks."
    pkg install python-numpy python-pillow -y
fi

# Python Hardening
echo "[*] Hardening Neural Intelligence Layer..."
pip install --upgrade pip $PIP_FLAGS
export MATHLIB="m"
export LDFLAGS="-lm -lcompiler_rt"

deps=("requests" "pyyaml" "pydantic" "rich" "prompt_toolkit" "httpx" "tenacity" "jinja2" "fire" "exa-py" "firecrawl-py" "parallel-web" "fal-client" "edge-tts" "PyJWT" "websockets" "nest-asyncio" "aiohttp" "imagehash" "ghunt")
for dep in "${deps[@]}"; do
    pip install "$dep" $PIP_FLAGS || echo "[!] Failed to procure $dep"
done

# Offensive Procurement
echo "[*] Procuring O365 Infiltration Module..."
pip install o365spray $PIP_FLAGS || {
    echo "[!] o365spray not in PyPI. Cloning Tactical Source..."
    rm -rf $HOME/o365spray
    git clone https://github.com/0xZDH/o365spray.git $HOME/o365spray
    cd $HOME/o365spray && pip install -r requirements.txt $PIP_FLAGS
}

# Global Link Enforcement
LAUNCHER="$HOME/hermes-sovereign-worm-v2/yousef-sh.sh"
if [ -f "$LAUNCHER" ]; then
    ln -sf "$LAUNCHER" "$PREFIX/bin/yousef"
    chmod +x "$LAUNCHER"
    echo "[✓] Global Entry Point: 'yousef' is Locked."
fi

echo -e "\033[1;32m[✓] VENV PROCUREMENT V11.4 COMPLETE. ALL SYSTEMS LIVE.\033[0m"
