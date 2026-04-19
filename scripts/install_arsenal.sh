#!/bin/bash
# Protocol: Sovereign V11.3 - Tactical Arsenal Procurement
# Target: Termux (Optimized 2026) / Kali / Linux

echo -e "\033[1;35m[*] INITIATING TACTICAL ARSENAL PROCUREMENT V11.3...\033[0m"

# Path Detection
PREFIX="${PREFIX:-/data/data/com.termux/files/usr}"
IS_TERMUX=false
if [ -d "/data/data/com.termux" ]; then IS_TERMUX=true; fi

# Repositories & Base Tooling
if [ "$IS_TERMUX" = true ]; then
    pkg update -y && pkg upgrade -y
    pkg install tur-repo root-repo x11-repo -y
    pkg install nmap sqlmap nikto whois tor proxychains-ng binutils clang make libffi openssl nodejs-lts patchelf -y
    
    # 2. Specialized Binaries (Handle Missing via direct clone if needed)
    echo "[*] Procuring Exploit-DB (SearchSploit)..."
    pkg install exploitdb -y || {
        echo "[!] Exploit-DB missing in pkg. Cloning manually..."
        git clone --depth 1 https://github.com/offensive-security/exploitdb.git $HOME/.exploitdb
        ln -sf $HOME/.exploitdb/searchsploit $PREFIX/bin/searchsploit
    }

    echo "[*] Procuring Argus (Network Flows)..."
    pkg install argus argus-clients -y || echo "[!] Argus missing. Using Nmap/Scapy fallbacks."
else
    sudo apt-get update -y
    sudo apt-get install nmap sqlmap nikto exploitdb argus-server argus-client whois tor proxychains4 -y
fi

# 3. Python Hardening (User-space & Specialized builds)
echo "[*] Hardening Neural Intelligence Layer..."
pip install --upgrade pip --user
export MATHLIB="m"
export LDFLAGS="-lm -lcompiler_rt"

if [ "$IS_TERMUX" = true ]; then
    pkg install python-numpy python-pillow -y
fi

# Tactical Dependency Procurement
deps=("requests" "pyyaml" "pydantic" "rich" "prompt_toolkit" "httpx" "tenacity" "jinja2" "fire" "exa-py" "firecrawl-py" "parallel-web" "fal-client" "edge-tts" "PyJWT" "websockets" "nest-asyncio" "aiohttp" "imagehash" "ghunt")
for dep in "${deps[@]}"; do
    pip install "$dep" --user || echo "[!] Failed to procure $dep"
done

# 4. Specialized Offensive Procurement (o365spray from source if PyPI fails)
echo "[*] Procuring O365 Infiltration Module..."
pip install o365spray --user || {
    echo "[!] o365spray not in PyPI. Cloning Tactical Source..."
    git clone https://github.com/0xZDH/o365spray.git $HOME/o365spray
    cd $HOME/o365spray && pip install -r requirements.txt --user
}

# 5. Global Link Enforcement
LAUNCHER="$HOME/hermes-sovereign-worm-v2/yousef-sh.sh"
if [ -f "$LAUNCHER" ]; then
    ln -sf "$LAUNCHER" "$PREFIX/bin/yousef"
    chmod +x "$LAUNCHER"
    echo "[✓] Global Entry Point: 'yousef' is Locked."
fi

echo -e "\033[1;32m[✓] TACTICAL PROCUREMENT V11.3 COMPLETE. ALL SYSTEMS LIVE.\033[0m"
