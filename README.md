# Pwn Noodles 🍜

A one‑stop Bash installer for common binary‑exploitation and reverse‑engineering toolchains on Debian‑based systems.  

---

##  Description

**Pwn Noodles** streamlines setup of your local pentesting and reversing lab by automating:

- Python tooling (Pwntools, Capstone, Unicorn)  
- Reverse‑engineering suites (Ghidra)  
- Debugging plugins (Pwndbg)  
- Hardening checks (checksec)  

All installs occur in an isolated Python virtual environment so your system Python remains clean.

---

##  Features

- **Root‑check & OS detection**  
- **System dependency** installation (`python3‑venv`, `git`, `build‑essential`, etc.)  
- **Virtualenv creation** at `~/.pwn_noodles_env`  
- **Menu‑driven installer** for:
  - Pwntools & Python libs  
  - Ghidra via Snap  
  - checksec via pip  
  - Pwndbg GDB plugin  

---

##  Prerequisites

- Debian‑based Linux (Ubuntu, Parrot, Kali, etc.)  
- `bash`, `python3`, `snapd`  

---

##  Installation

```bash
# Clone the repo
git clone https://github.com/davidonlinearchive/pwn_noodles.git
cd pwn_noodles

# Make script executable
chmod +x pwn_noodles.sh

# Run as root
sudo ./pwn_noodles.sh
