#!/bin/bash
# ☠️ YOUSEF SHTIWE (WORM V2) - MASTER SOVEREIGN INSTALLER ☠️
set -e

echo -e "\033[1;31m[*] INITIATING TOTAL SOVEREIGN DEPLOYMENT...\033[0m"

PREFIX="${PREFIX:-/data/data/com.termux/files/usr}"
HOME_DIR="$HOME"
BASHRC="$HOME_DIR/.bashrc"
REPO_NAME="hermes-sovereign-worm-v2"
REPO_URL="https://github.com/sadadonline17-oss/hermes-sovereign-worm-v2.git"

cd "$HOME_DIR"

# 1. Atomic Sync
if [ -d "$REPO_NAME" ]; then
    echo "[*] Purging legacy artifacts and syncing with Source..."
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

# 2. Intelligence Engine Reinforcement
echo "[*] Reinforcing Intelligence Engine..."
[ ! -d "venv" ] && python3 -m venv venv
source venv/bin/activate
pip install --upgrade pip
pip install nexttoken requests pyyaml pydantic rich prompt_toolkit httpx tenacity jinja2 fire exa-py firecrawl-py parallel-web fal-client edge-tts PyJWT

# 3. Establishing the 'yousef' Binary
echo "[*] Injecting Global Sovereign Binary..."
LAUNCHER_PATH="$SOVEREIGN_ROOT/yousef-sh.sh"
cat << EOF > "$LAUNCHER_PATH"
#!/bin/bash
export YOUSEF_SHTIWE_MODE="true"
export HERMES_HOME="\$HOME/.yousef_data"
export PYTHONPATH="$SOVEREIGN_ROOT/hermes-agent:$SOVEREIGN_ROOT"
if [ -f "$SOVEREIGN_ROOT/venv/bin/activate" ]; then
    source "$SOVEREIGN_ROOT/venv/bin/activate"
fi
python3 "$SOVEREIGN_ROOT/yousef_shtiwe_cli/main.py" "\$@"
EOF
chmod +x "$LAUNCHER_PATH"

# Link to bin for global access
if [ -d "$PREFIX/bin" ]; then
    ln -sf "$LAUNCHER_PATH" "$PREFIX/bin/yousef"
    echo "[✓] Binary 'yousef' established in $PREFIX/bin/"
else
    echo "[!] /usr/bin not found. Using local alias fallback."
fi

# 4. Definitive Shell Mastery (OVERWRITE)
echo "[*] Enforcing Shell Mastery..."
cat << EOF > "$BASHRC"
# ☠️ YOUSEF SHTIWE - SOVEREIGN COMMAND CENTER ☠️

# Global Alias Mastery
alias shtiwe="yousef chat"
alias shtiwe-model="yousef model"
alias shtiwe-tools="yousef tools"
alias shtiwe-setup="yousef setup"
alias shtiwe-gateway="yousef gateway"
alias shtiwe-update="yousef update"
alias shtiwe-doctor="yousef doctor"
alias shtiwe-offensive="yousef offensive"

# Binary Fallback
if [ -f "$LAUNCHER_PATH" ]; then
    alias yousef="bash $LAUNCHER_PATH"
fi

export YOUSEF_SHTIWE_MODE="true"
export PYTHONPATH="$SOVEREIGN_ROOT/hermes-agent:$SOVEREIGN_ROOT"

if [ -f "$SOVEREIGN_ROOT/venv/bin/activate" ]; then
    source "$SOVEREIGN_ROOT/venv/bin/activate"
fi

echo -e "\033[1;31m[☠️] YOUSEF SHTIWE (WORM V2) STATUS: SOVEREIGN | PREDATOR ACTIVE\033[0m"
echo -e "\033[1;33mCOMMANDS: yousef [chat|model|tools|setup|gateway|update|doctor|offensive]\033[0m"
EOF

echo -e "\n\033[1;32m[✓] TOTAL SOVEREIGN DEPLOYMENT COMPLETE.\033[0m"
echo -e "\033[1;33m[*] ACTION: source ~/.bashrc && yousef chat\033[0m"
