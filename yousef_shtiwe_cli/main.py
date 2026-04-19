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
    console.print(Panel("[bold #00FF00]☠ يوسف اشتيوي - النسخة السيادية المطلقة V10.1 ☠[/]", border_style="#00FF00", subtitle="[REALITY: ABSOLUTE]", subtitle_align="right"))
    console.print("[bold #BF00FF]PREDATOR STATUS: ACTIVE | ALL TOOLS ARMED[/]\n")

def run_full_arsenal_install():
    display_banner()
    console.print(Panel("[bold #00FF00]☠ بدء الإصلاح الشامل وتجهيز الترسانة السيادية ☠[/]", border_style="#00FF00"))
    script_path = "scripts/install_arsenal.sh"
    if not os.path.exists(script_path):
        console.print("[bold red][!] ملف التجهيز مفقود![/]")
        return
    try:
        subprocess.run(["bash", script_path], check=True)
        console.print("[bold green][✓] تم سحق الأخطاء وتجهيز الترسانة بالكامل لـ يوسف اشتيوي.[/]")
    except Exception as e:
        console.print(f"[bold red][!] انقطع التجهيز: {e}[/]")

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
    if cmd == "full-install" or cmd == "fix":
        run_full_arsenal_install()
        return
    if cmd == "offensive":
        target = sys.argv[2] if len(sys.argv) > 2 else "local"
        launch_core("chat", ["--query", f"Execute offensive mission on {target}"])
        return
    launch_core(cmd, sys.argv[2:])

if __name__ == "__main__":
    main()
