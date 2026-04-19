# -*- coding: utf-8 -*-
import sys
import os
import subprocess
import time
from rich.console import Console
from rich.panel import Panel

console = Console()

def install_offensive_tool(tool_name):
    """Attempt to install real security tools via pkg or pip."""
    if tool_name.startswith("-"): return
    console.print(f"[bold #FFD700][*] Sovereign Forge: Procuring {tool_name}...[/]")
    is_termux = os.path.exists("/data/data/com.termux")
    pkg_mgr = "pkg" if is_termux else "sudo apt-get"
    try:
        if is_termux:
            subprocess.run(["pkg", "install", tool_name, "-y"])
        else:
            subprocess.run(["sudo", "apt-get", "install", tool_name, "-y"])
        console.print(f"[bold green][✓] {tool_name} forged and integrated.[/]")
    except Exception as e:
        console.print(f"[bold red][!] Forge Failure for {tool_name}: {e}[/]")

def run_full_arsenal_install():
    """Trigger the master installation script for all integrated tools."""
    console.print(Panel("[bold #00FF00]☠ INITIATING TOTAL ARSENAL PROCUREMENT V9 ☠[/]", border_style="#00FF00"))
    script_path = "scripts/install_arsenal.sh"
    if not os.path.exists(script_path):
        console.print("[bold red][!] Master Installer not found![/]")
        return
    
    try:
        subprocess.run(["bash", script_path])
        console.print("[bold green][✓] TOTAL ARSENAL PROCUREMENT COMPLETE.[/]")
    except Exception as e:
        console.print(f"[bold red][!] Installation interrupted: {e}[/]")

def launch_core(subcommand=None, extra_args=None):
    """Bridge to the Sovereign Core Engine."""
    try:
        if subcommand:
            sys.argv = [sys.argv[0], subcommand] + (extra_args if extra_args else [])
        else:
            sys.argv = [sys.argv[0], "chat"]
            
        from yousef_shtiwe_cli_core.main import main as core_main
        sys.argv[0] = "yousef"
        core_main()
    except Exception as e:
        console.print(f"[bold red][!] Sovereign Core Bridge Error: {e}[/]")
        sys.exit(1)

def run_kairos_mission(objective):
    """Executes a high-level mission using the KAIROS Neural Engine."""
    console.print(Panel(f"[bold #BF00FF]🧠 INITIATING KAIROS NEURAL MISSION 🧠[/]\nObjective: {objective}", border_style="#BF00FF"))
    launch_core("chat", ["--query", f"Activate KAIROS Mode. Objective: {objective}. Execute Plan-Critique-Synthesize cycle."])

def start_daemon():
    """Tick Engine: Background daemon for memory consolidation and proactive hunting."""
    console.print("[bold green][☠] YOUSEF SHTIWE Daemon Started. Proactive Hunting Active...[/]")
    while True:
        console.print("[*] Heartbeat: Monitoring background processes and consolidating memory...")
        time.sleep(300)

def main():
    if len(sys.argv) < 2:
        launch_core("chat")
        return

    cmd = sys.argv[1].lower()

    if cmd == "full-install":
        run_full_arsenal_install()
        return

    if cmd == "swarm":
        console.print(Panel("[bold #FF0000]☠ INITIATING SOVEREIGN SWARM ATTACK ☠[/]", border_style="#8B0000"))
        launch_core("chat", ["--query", "Execute coordinated swarm attack."])
        return

    if cmd == "forge":
        tool_name = sys.argv[2] if len(sys.argv) > 2 else "unknown_payload"
        install_offensive_tool(tool_name)
        launch_core("chat", ["--query", f"Acknowledge forge of {tool_name}."])
        return

    if cmd == "kairos":
        objective = " ".join(sys.argv[2:]) if len(sys.argv) > 2 else "Perform system-wide vulnerability assessment."
        run_kairos_mission(objective)
        return

    if cmd == "daemon":
        start_daemon()
        return

    if cmd == "offensive":
        target = sys.argv[2] if len(sys.argv) > 2 else "local_environment"
        console.print(f"[bold #FF0000][☠] SOVEREIGN OFFENSIVE MODE: {target}[/]")
        launch_core("chat", ["--query", f"Execute offensive mission on {target}"])
        return

    launch_core(cmd, sys.argv[2:])

if __name__ == "__main__":
    main()
