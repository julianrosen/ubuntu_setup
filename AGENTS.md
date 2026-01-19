# AGENTS.md

## General Instructions
- Keep the code as simple as possible; simplicity trumps robustness and generality.
- Prefer flat, linear logic over nested control flow. Avoid new helper functions or files unless they are truly necessary.

## Repository Outline
- `install.sh`: Top-level orchestrator that runs the component install scripts in order.
- `autosuspend/`: Autosuspend setup and cron integration using templates.
- `bin/`: Installs helper scripts into `~/bin`.
- `codex/`: Installs the OpenAI Codex CLI via npm.
- `git/`: Installs git and configures global user settings.
- `i3/`: i3 window manager installation and config.
- `latex/`: LaTeX tools and templates setup.
- `python/`: Python tooling, venv creation, and common packages.
- `ssh/`: SSH server install and config.
- `sudo/`: Sudo convenience configuration.
- `swapfile/`: Swapfile setup.
- `terminal/`: GNOME Terminal profiles and keybindings.
- `vim/`: Vim setup and system default editor config.
- `vscode/`: VS Code install and settings.
- `zsh/`: Zsh install and config.
- `config.yaml`: Placeholder config (not implemented yet).
