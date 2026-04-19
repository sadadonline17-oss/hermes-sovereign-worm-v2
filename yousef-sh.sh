#!/bin/bash
# YOUSEF SHTIWE - SOVEREIGN COMMANDER V12.2
export YOUSEF_SHTIWE_MODE="true"
export HERMES_HOME="$HOME/.yousef_data"
# Find absolute root
SOVEREIGN_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export PYTHONPATH="$SOVEREIGN_ROOT/hermes-agent:$SOVEREIGN_ROOT"

# Auto-activate venv
if [ -f "$SOVEREIGN_ROOT/venv/bin/activate" ]; then
    source "$SOVEREIGN_ROOT/venv/bin/activate"
fi

# Absolute path execution
PYTHON_BIN=$(which python3.13 || which python3 || which python)
$PYTHON_BIN "$SOVEREIGN_ROOT/yousef_shtiwe_cli/main.py" "$@"
