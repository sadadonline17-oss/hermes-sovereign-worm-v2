import os

def stabilize_core_main():
    main_path = "yousef_shtiwe_cli/main.py"
    if not os.path.exists(main_path):
        print(f"Error: {main_path} not found.")
        return

    # Definitive Main.py logic - ensuring NO NameError and correct routing
    correct_content = """# -*- coding: utf-8 -*-
import sys
import os
import argparse
from rich.console import Console

console = Console()

class Colors:
    RESET = \"\\033[0m\"
    BOLD = \"\\033[1m\"
    BLOOD_RED = \"\\033[38;5;160m\"
    NEON_RED = \"\\033[38;5;196m\"
    VOID_BLACK = \"\\033[38;5;232m\"
    GLITCH_GREEN = \"\\033[38;5;46m\"

def launch_rebranded_engine():
    \"\"\"Hands off execution to the rebranded core engine.\"\"\"
    try:
        from yousef_shtiwe_cli_core.main import main as core_main
        # Re-set sys.argv[0] so the help output looks correct
        sys.argv[0] = \"yousef shtiwe\"
        core_main()
    except Exception as e:
        console.print(f\"[bold red][!] Core engine failure: {e}[/bold red]\")
        sys.exit(1)

def handle_offensive(args):
    \"\"\"Handles the Sovereign Offensive Arsenal.\"\"\"
    target = args.target
    mode = args.mode or \"recon\"
    
    console.print(f\"[bold #FF0000][☠] DEPLOYING SOVEREIGN ARSENAL IN {mode.upper()} MODE ON: {target}[/bold #FF0000]\")
    
    if mode == \"recon\":
        console.print(\"[bold #FF4500][*] Extracting metadata, sniffing open ports, and mapping attack surface...[/bold #FF4500]\")
    elif mode == \"exploit\":
        console.print(\"[bold #FF0000][!] Executing Sovereign payload. Bypassing security guards...[/bold #FF0000]\")
        console.print(\"[bold #00FF41][✓] SYSTEM BREACHED. DOMINION ESTABLISHED.[/bold #00FF41]\")
    elif mode == \"payload\":
        console.print(f\"[bold #FF4500][*] Generating custom Sovereign payload for {target}...[/bold #FF4500]\")
    elif mode == \"zero-trace\":
        console.print(\"[bold #8B0000][☠] SHREDDING LOGS. PURGING FOOTPRINTS. VOID GHOST ACTIVE.[/bold #8B0000]\")

def main():
    if len(sys.argv) < 2:
        launch_rebranded_engine()
        return

    cmd = sys.argv[1].lower()
    
    if cmd == \"offensive\":
        parser = argparse.ArgumentParser(prog=\"yousef shtiwe offensive\")
        parser.add_argument(\"target\", help=\"Target IP or domain\")
        parser.add_argument(\"--mode\", choices=[\"recon\", \"exploit\", \"payload\", \"zero-trace\"], default=\"recon\")
        args = parser.parse_args(sys.argv[2:])
        handle_offensive(args)
        return

    # Redirect all known subcommands to core
    core_cmds = [\"chat\", \"model\", \"gateway\", \"setup\", \"status\", \"cron\", \"doctor\", \"update\"]
    if cmd in core_cmds or cmd == \"help\":
        sys.argv = sys.argv[1:]
        if cmd == \"help\": sys.argv = [\"--help\"]
        launch_rebranded_engine()
    else:
        # Default pass-through
        sys.argv = sys.argv[1:]
        launch_rebranded_engine()

if __name__ == \"__main__\":
    main()
"""
    with open(main_path, "w") as f:
        f.write(correct_content)
    print("[✓] Main.py stabilized and routing fixed.")

if __name__ == "__main__":
    stabilize_core_main()
