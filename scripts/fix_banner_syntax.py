import os

def fix_banner():
    banner_path = "hermes-agent/yousef_shtiwe_cli_core/banner.py"
    
    # Absolute Shadow Banner - Cleaned and Verified
    # Note: Using raw string and escaping square brackets to prevent rich/f-string confusion if needed
    # But here the error was raw lines outside of the variable definition
    
    sovereign_banner = r"""
    [bold #8B0000]      ██╗   ██╗ ██████╗ ██╗   ██╗███████╗███████╗███████╗          [/]
    [bold #8B0000]      ╚██╗ ██╔╝██╔═══██╗██║   ██║██╔════╝██╔════╝██╔════╝          [/]
    [bold #8B0000]       ╚████╔╝ ██║   ██║██║   ██║███████╗█████╗  █████╗            [/]
    [bold #8B0000]        ╚██╔╝  ██║   ██║██║   ██║╚════██║██╔══╝  ██╔══╝            [/]
    [bold #8B0000]         ██║   ╚██████╔╝╚██████╔╝███████║██║     ██║               [/]
    [bold #8B0000]         ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝╚═╝     ╚═╝               [/]
    [bold #383838]      ╠══════════════════════════════════════════════════════════╣[/]
    [bold #FF0000]            ███████╗██╗  ██╗████████╗██╗██╗    ██╗███████╗         [/]
    [bold #FF0000]            ██╔════╝██║  ██║╚══██╔══╝██║██║    ██║██╔════╝         [/]
    [bold #FF0000]            ███████╗███████║   ██║   ██║██║ █╗ ██║█████╗           [/]
    [bold #FF0000]            ╚════██║██╔══██║   ██║   ██║██║███╗██║██╔══╝           [/]
    [bold #FF0000]            ███████║██║  ██║   ██║   ██║╚███╔███╔╝███████╗         [/]
    [bold #FF0000]            ╚══════╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚══╝╚══╝ ╚══════╝         [/]
    [bold #660000]               [ SYSTEM COMPROMISED : SOVEREIGN CORE ]              [/]
"""

    hero_section = r"""[#8B0000]                   ░░▒▒▓▓██████████████████▓▓▒▒░░                    [/]
    [#8B0000]                   ▒▒                              ▒▒                [/]
    [#FF0000]                   ▒▒   [bold]>_ BYPASSING_FIREWALL...[/]   ▒▒                [/]
    [#FF0000]                   ▒▒   [bold]>_ INJECTING_PAYLOAD...[/]    ▒▒                [/]
    [#8B0000]                   ░░▒▒▓▓██████████████████▓▓▒▒░░                    [/]
    [#333333]                   [dim]         [bold #FF0000]STATUS: PREDATOR | SOVEREIGN CORE ACTIVE[/]        [/]"""

    # Reading the file to find where to replace
    with open(banner_path, "r") as f:
        content = f.read()

    # Define the new ASCII Art & Branding section
    new_branding_section = f"""
# =========================================================================
# ASCII Art & Branding
# =========================================================================

# YOUSEF SHTIWE OVERRIDE
YOUSEF_SHTIWE_BANNER = \"\"\"{sovereign_banner}\"\"\"

SHTIWE_HERO = \"\"\"{hero_section}\"\"\"

HERMES_AGENT_LOGO = YOUSEF_SHTIWE_BANNER
HERMES_CADUCEUS = SHTIWE_HERO

# =========================================================================
"""

    # Surgical replacement of the corrupted section
    # Using regex to find the start of ASCII section and the end (before get_available_skills)
    import re
    pattern = re.compile(r"# =+.*?# ASCII Art & Branding.*?# =+", re.DOTALL)
    
    # If the section exists, replace it. Otherwise, we might have multiple definitions.
    # Let's just find everything between the first 'YOUSEF_SHTIWE_BANNER' and 'def get_available_skills'
    
    final_content = re.sub(r"YOUSEF_SHTIWE_BANNER = .*?def get_available_skills", 
                           f"YOUSEF_SHTIWE_BANNER = \"\"\"{sovereign_banner}\"\"\"\n\nSHTIWE_HERO = \"\"\"{hero_section}\"\"\"\n\nHERMES_AGENT_LOGO = YOUSEF_SHTIWE_BANNER\nHERMES_CADUCEUS = SHTIWE_HERO\n\ndef get_available_skills", 
                           content, flags=re.DOTALL)

    with open(banner_path, "w") as f:
        f.write(final_content)
    
    print("[✓] banner.py syntax error fixed.")

if __name__ == "__main__":
    fix_banner()
