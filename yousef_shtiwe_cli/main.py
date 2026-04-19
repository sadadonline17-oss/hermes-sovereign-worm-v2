# -*- coding: utf-8 -*-
import sys
import os
import subprocess
import time
from rich.console import Console
from rich.panel import Panel
from rich.text import Text

console = Console()

def display_banner():
    banner = """
    ▄████▄   ▒█████   ██▒   █▓▓█████  ██▀███  ▓█████  ██▓  ▄████  ███▄    █     
   ▒██▀ ▀█  ▒██▒  ██▒▓██░   █▒▓█   ▀ ▓██ ▒ ██▒▓█   ▀ ▓██▒ ██▒ ▀█▒ ██ ▀█   █     
   ▒▓█    ▄ ▒██░  ██▒ ▓██  █▒░▒███   ▓██ ░▄█ ▒▒███   ▒██░▒██░▄▄▄░▓██  ▀█ ██▒    
   ▒▓▓▄ ▄██▒▒██   ██░  ▒██ █░░▒▓█  ▄ ▒██▀▀█▄  ▒▓█  ▄ ▒██░░▓█  ██▓▓██▒  ▐▌██▒    
   ▒ ▓███▀ ░░ ████▓▒░   ▒▀█░  ░▒████▒░██▓ ▒██▒░▒████▒░██░░▒▓███▀▒▒██░   ▓██░    
    """
    console.print(Text(banner, style="bold #BF00FF"))
    console.print(Panel("[bold #00FF00]☠ يوسف اشتيوي - النسخة السيادية المطلقة V10 ☠[/]", border_style="#00FF00", expand=False))
    console.print("[bold #BF00FF]PREDATOR STATUS: ACTIVE | REALITY: ABSOLUTE[/]\n")

def install_offensive_tool(tool_name):
    if tool_name.startswith("-"): return
    console.print(f"[bold #FFD700][*] Sovereign Forge: Procuring {tool_name}...[/]")
    is_termux = os.path.exists("/data/data/com.termux")
    try:
        if is_termux:
            subprocess.run(["pkg", "install", tool_name, "-y"])
        else:
            subprocess.run(["sudo", "apt-get", "install", tool_name, "-y"])
        console.print(f"[bold green][✓] {tool_name} forged and integrated.[/]")
    except Exception as e:
        console.print(f"[bold red][!] Forge Failure for {tool_name}: {e}[/]")

def run_full_arsenal_install():
    display_banner()
    console.print(Panel("[bold #00FF00]☠ بدء التجهيز الشامل للترسانة السيادية ☠[/]", border_style="#00FF00"))
    script_path = "scripts/install_arsenal.sh"
    if not os.path.exists(script_path):
        console.print("[bold red][!] ملف التثبيت غير موجود![/]")
        return
    try:
        subprocess.run(["bash", script_path])
        console.print("[bold green][✓] اكتمل تجهيز الترسانة بالكامل.[/]")
    except Exception as e:
        console.print(f"[bold red][!] انقطع التثبيت: {e}[/]")

def launch_core(subcommand=None, extra_args=None):
    try:
        if subcommand:
            sys.argv = [sys.argv[0], subcommand] + (extra_args if extra_args else [])
        else:
            sys.argv = [sys.argv[0], "chat"]
            
        from yousef_shtiwe_cli_core.main import main as core_main
        sys.argv[0] = "yousef"
        core_main()
    except Exception as e:
        console.print(f"[bold red][!] خطأ في نواة السيادة: {e}[/]")
        sys.exit(1)

def main():
    if len(sys.argv) < 2:
        display_banner()
        launch_core("chat")
        return

    cmd = sys.argv[1].lower()

    if cmd == "full-install":
        run_full_arsenal_install()
        return

    if cmd == "offensive":
        target = sys.argv[2] if len(sys.argv) > 2 else "local"
        launch_core("chat", ["--query", f"Execute offensive mission on {target}"])
        return

    launch_core(cmd, sys.argv[2:])

if __name__ == "__main__":
    main()
