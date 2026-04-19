#!/bin/bash
# ☠️ YOUSEF SHTIWE (WORM V2) - ABSOLUTE SOVEREIGN INSTALLER ☠️
set -e

echo "[*] INITIATING TOTAL SOVEREIGN DEPLOYMENT..."

PREFIX="${PREFIX:-/data/data/com.termux/files/usr}"
HOME_DIR="$HOME"
BASHRC="$HOME_DIR/.bashrc"
REPO_NAME="hermes-sovereign-worm-v2"
REPO_URL="https://github.com/sadadonline17-oss/hermes-sovereign-worm-v2.git"

cd "$HOME_DIR"

# 1. Force Clean Sync
if [ -d "$REPO_NAME" ]; then
    echo "[*] Purging legacy artifacts..."
    cd "$REPO_NAME"
    git fetch origin main
    git reset --hard origin/main
    git clean -fd
    cd ..
else
    git clone "$REPO_URL" "$REPO_NAME"
fi

SOVEREIGN_ROOT="$HOME_DIR/$REPO_NAME"
cd "$SOVEREIGN_ROOT"

# 2. Re-establish Intelligence Engine
echo "[*] Reinforcing Intelligence Engine..."
[ ! -d "venv" ] && python3 -m venv venv
source venv/bin/activate
pip install --upgrade pip
pip install nexttoken requests pyyaml pydantic rich prompt_toolkit httpx tenacity jinja2 fire exa-py firecrawl-py parallel-web fal-client edge-tts PyJWT

# 3. Establish Absolute Launcher
echo "[*] Injecting Absolute Sovereign Launcher..."
LAUNCHER_PATH="$SOVEREIGN_ROOT/yousef-sh.sh"
cat << EOF > "$LAUNCHER_PATH"
#!/bin/bash
export YOUSEF_SHTIWE_MODE="true"
export HERMES_HOME="$HOME_DIR/hermes_sovereign_data"
export PYTHONPATH="$SOVEREIGN_ROOT/hermes-agent:$SOVEREIGN_ROOT"
if [ -f "$SOVEREIGN_ROOT/venv/bin/activate" ]; then
    source "$SOVEREIGN_ROOT/venv/bin/activate"
fi
python3 "$SOVEREIGN_ROOT/yousef_shtiwe_cli/main.py" "\$@"
EOF
chmod +x "$LAUNCHER_PATH"

# 4. Definitive Shell Configuration (OVERWRITE)
echo "[*] Enforcing Clean Shell Logic..."
cat << EOF > "$BASHRC"
# ☠️ YOUSEF SHTIWE - SOVEREIGN COMMAND CENTER ☠️

yousef() {
    if [ "\$1" = "shtiwe" ]; then
        shift
        bash "$LAUNCHER_PATH" "\$@"
    else
        echo "Usage: yousef shtiwe [offensive|gateway|chat|setup|status]"
        echo "Quick Access: shtiwe"
    fi
}

alias shtiwe="yousef shtiwe chat"
alias hermes="yousef shtiwe"

export YOUSEF_SHTIWE_MODE="true"
export PYTHONPATH="$SOVEREIGN_ROOT/hermes-agent:$SOVEREIGN_ROOT"

if [ -f "$SOVEREIGN_ROOT/venv/bin/activate" ]; then
    source "$SOVEREIGN_ROOT/venv/bin/activate"
fi

echo -e "\033[1;31m[☠️] YOUSEF SHTIWE (WORM V2) STATUS: SOVEREIGN\033[0m"
EOF

# 5. Global Link Injection
rm -f "$PREFIX/bin/yousef"
ln -sf "$LAUNCHER_PATH" "$PREFIX/bin/yousef"

echo -e "\n\033[1;32m[✓] TOTAL SOVEREIGN DEPLOYMENT COMPLETE.\033[0m"
echo -e "\033[1;33m[*] RUN: source ~/.bashrc && shtiwe\033[0m"
