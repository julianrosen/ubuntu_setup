# Ubuntu Setup

Set up a new Ubuntu desktop installation the way I like it.

## Usage

From the repo root:

```bash
bash install.sh
```
You can configure some settings in `config.yaml`.

## Components
Each configuration/installation is in a separate directory.
- `sudo`: Don't require a password for `sudo`
- `swapfile`: Set up a swapfile
- `i3`: Set up i3 window manager and install my config.
- `bin`: Install some scripts I use periodically into `~/bin`
- `latex`: Install LaTeX, with editor and templates
- `autosuspend`: Install and configure `autosuspend`
- `codex`: Install the OpenAI Codex CLI via npm
- `terminal`: GNOME Terminal profile and keybindings
- `zsh`: Install Zsh with my config
- `python`: Create a virtual python environment with my commonly-used packages
- `git`: Install git and configures global user settings
- `ssh`: SSH server config
- `vim`: Set vim as system default editor and install my vimrc file
- `vscode`: Install VS Code with my preferred settings
