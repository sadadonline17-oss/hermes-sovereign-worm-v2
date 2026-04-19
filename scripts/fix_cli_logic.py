import os
import re

def fix_show_banner_in_cli():
    cli_path = "hermes-agent/cli.py"
    if not os.path.exists(cli_path):
        return

    with open(cli_path, "r") as f:
        content = f.read()

    # Fixed version of show_banner that includes the logo and context logic
    fixed_show_banner = """
    def show_banner(self):
        \"\"\"Display the Sovereign welcome banner.\"\"\"
        self.console.clear()
        try:
            from yousef_shtiwe_cli_core.banner import HERMES_AGENT_LOGO
            self.console.print(HERMES_AGENT_LOGO, justify="center")
            self.console.print()
        except Exception:
            pass

        # Get context length for display
        ctx_len = None
        if hasattr(self, 'agent') and self.agent and hasattr(self.agent, 'context_compressor'):
            ctx_len = self.agent.context_compressor.context_length
        
        term_width = shutil.get_terminal_size().columns
"""
    # Replace the broken function definition
    content = re.sub(r"def show_banner\(self\):.*?term_width = shutil\.get_terminal_size\(\)\.columns", fixed_show_banner, content, flags=re.DOTALL)

    with open(cli_path, "w") as f:
        f.write(content)
    print("[✓] cli.py show_banner repaired. Context logic restored.")

if __name__ == "__main__":
    fix_show_banner_in_cli()
