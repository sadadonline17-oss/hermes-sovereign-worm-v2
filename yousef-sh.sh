#!/bin/bash
export YOUSEF_SHTIWE_MODE="true"
export HERMES_HOME="/home/nexttoken/hermes_sovereign_data"
export PYTHONPATH="/home/nexttoken/hermes-agent:/home/nexttoken"
if [ -f "/home/nexttoken/venv/bin/activate" ]; then source "/home/nexttoken/venv/bin/activate"; fi
python3 "/home/nexttoken/yousef_shtiwe_cli/main.py" "$@"
