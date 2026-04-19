#!/bin/bash
export YOUSEF_SHTIWE_MODE="true"
export HERMES_HOME="$HOME/.yousef_data"
# Dynamically find the repo root
SOVEREIGN_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export PYTHONPATH="$SOVEREIGN_ROOT/hermes-agent:$SOVEREIGN_ROOT"

if [ -f "$SOVEREIGN_ROOT/venv/bin/activate" ]; then
    source "$SOVEREIGN_ROOT/venv/bin/activate"
fi

# Force use of Python 3.13 if available
PYTHON_BIN=$(which python3.13 || which python3 || which python)
$PYTHON_BIN "$SOVEREIGN_ROOT/yousef_shtiwe_cli/main.py" "$@"
