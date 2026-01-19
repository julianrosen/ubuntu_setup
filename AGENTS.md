# AGENTS.md

## General Instructions
- Keep the code as simple as possible; simplicity trumps robustness and generality.
- Prefer flat, linear logic over nested control flow. Avoid new helper functions or files unless they are truly necessary.

## Repository Outline
- `install.sh`: Top-level orchestrator that runs the component install scripts in order.
- `components/autosuspend/`: Autosuspend setup and cron integration using templates.
- `components/bin/`: Installs helper scripts into `~/bin`.
- `components/codex/`: Installs the OpenAI Codex CLI via npm.
- `components/git/`: Installs git and configures global user settings.
- `components/i3/`: i3 window manager installation and config.
- `components/latex/`: LaTeX tools and templates setup.
- `components/python/`: Python tooling, venv creation, and common packages.
- `components/ssh/`: SSH server install and config.
- `components/sudo/`: Sudo convenience configuration.
- `components/swapfile/`: Swapfile setup.
- `components/terminal/`: GNOME Terminal profiles and keybindings.
- `components/vim/`: Vim setup and system default editor config.
- `components/vscode/`: VS Code install and settings.
- `components/zsh/`: Zsh install and config.
- `config.yaml`: Config file with some parameters that can be changed by the user.
