# YOUSEF SHTIWE - SOVEREIGN COMMANDER V13.2
export YOUSEF_SHTIWE_MODE="true"
export HERMES_HOME="$HOME/.yousef_data"
SOVEREIGN_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export PYTHONPATH="$SOVEREIGN_ROOT/hermes-agent:$SOVEREIGN_ROOT"

# Inject System Site-Packages to guarantee binary visibility
export PYTHONPATH="$PYTHONPATH:/data/data/com.termux/files/usr/lib/python3.13/site-packages"

if [ -f "$SOVEREIGN_ROOT/venv/bin/activate" ]; then
    source "$SOVEREIGN_ROOT/venv/bin/activate"
fi

PYTHON_BIN=$(which python3.13 || which python3 || which python)
$PYTHON_BIN "$SOVEREIGN_ROOT/yousef_shtiwe_cli/main.py" "$@"
