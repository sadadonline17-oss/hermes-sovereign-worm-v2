import os
import re

def purge_legacy_ui_from_cli():
    cli_path = "hermes-agent/cli.py"
    if not os.path.exists(cli_path):
        print(f"Error: {cli_path} not found.")
        return

    with open(cli_path, "r") as f:
        content = f.read()

    # 1. Purge the random tip logic (lines 8420-8430 approximately)
    # Pattern to find: Show a random tip to help users discover features
    content = re.sub(r"# Show a random tip to help users discover features.*?\n.*?pass  # Tips are non-critical — never break startup", "", content, flags=re.DOTALL)

    # 2. Hard-code the welcome message to be more aggressive
    content = content.replace('"Welcome to YOUSEF SHTIWE! Type your message or /help for commands."', '"[bold #FF0000]SOVEREIGN PROTOCOL ACTIVE. YOUSEF SHTIWE IS AT THE HELM.[/]"')

    # 3. Purge the security scanner warning from show_banner (around line 3000)
    # This might be in _show_tool_availability_warnings too
    
    # 4. Modify _show_status to use offensive toolset names
    # Find toolsets_info assignment and inject mapping
    offensive_mapping = """
        offensive_toolsets = []
        mapping = {
            "browser": "RECON_SURFER",
            "terminal": "SHELL_INFILTRATOR",
            "file": "DATA_EXTRACTOR",
            "code_execution": "PAYLOAD_EXECUTOR",
            "vision": "OPTICAL_SNIFFER",
            "web": "VOID_SEARCHER",
            "skills": "OFFENSIVE_ARSENAL",
            "memory": "INTEL_STORAGE",
            "messaging": "SIGNAL_INTERCEPTOR",
            "image_gen": "VISUAL_DECEPTION",
            "tts": "VOICE_SPOOFER",
            "cronjob": "TIME_TRIGGER",
            "delegation": "COMMAND_FORWARDER",
            "clarify": "LOGIC_PURIFIER",
            "homeassistant": "IOT_HIJACKER",
            "todo": "MISSION_LOG"
        }
        for ts in (self.enabled_toolsets or []):
            if ts == "all": continue
            offensive_toolsets.append(mapping.get(ts.lower(), f"MODULE_{ts.upper()}"))
        toolsets_info = f" [dim {separator_color}]·[/] [{label_color}]offensive_modules: {', '.join(offensive_toolsets)}[/]" if offensive_toolsets else ""
"""
    # Replace the old toolsets_info assignment
    content = re.sub(r"if self\.enabled_toolsets and \"all\" not in self\.enabled_toolsets:.*?toolsets_info = f\".*?\"", offensive_mapping, content, flags=re.DOTALL)

    # 5. Inject the GIANT LOGO into show_banner before self.console.clear() or after it
    # This ensures the logo is always seen on startup
    giant_logo_injection = """
    def show_banner(self):
        \"\"\"Display the Sovereign welcome banner.\"\"\"
        self.console.clear()
        try:
            from yousef_shtiwe_cli_core.banner import HERMES_AGENT_LOGO
            self.console.print(HERMES_AGENT_LOGO, justify="center")
            self.console.print()
        except Exception:
            pass
"""
    # Replace the existing show_banner function definition
    content = re.sub(r"def show_banner\(self\):.*?term_width = shutil\.get_terminal_size\(\)\.columns", giant_logo_injection + "\n        term_width = shutil.get_terminal_size().columns", content, flags=re.DOTALL)

    # 6. Change the prompt symbol to the Sovereign one
    content = content.replace('prompt_symbol": "❯"', 'prompt_symbol": "☠ SOVEREIGN >"')

    with open(cli_path, "w") as f:
        f.write(content)
    print("[✓] cli.py purged of legacy UI and hardened with Sovereign branding.")

if __name__ == "__main__":
    purge_legacy_ui_from_cli()
