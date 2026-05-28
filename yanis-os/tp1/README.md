# Assignment 1 — Environment Setup & Basic System Information

**Author:** Yanis Maisonneuve

## Overview
This repository contains the first assignment for the Operating Systems course (2026). The goal is to prepare a minimal environment and run a Bash script that reports basic system information. The script is intended to run on local Linux systems as well as cloud-based shells (e.g., Killercoda or Google Colab terminals).

## Script
The script `systems_infos_MY.sh` prints the following information:
- Operating system distribution and Linux kernel version
- Currently logged-in user
- Current working directory

## Requirements
- Bash (sh-compatible shell)
- No external dependencies; works in non-interactive cloud shells

## Usage
1. Make the script executable:
```bash
chmod +x system_info.sh
```
2. Run the script:
```bash
./systems_infos_MY.sh
```

## Deliverables
- `system_info.sh` — the reporting script
- `tp1_screen.odt` — optional screenshot/document demonstrating execution

## Notes
- The script uses colored output by default; colors are ANSI escape codes and may be disabled or ignored by some terminals.
