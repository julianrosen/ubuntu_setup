#!/usr/bin/env bash

sudo apt install yq

bash sudo/sudo_no_passwd.sh

APT_PACKAGES="$(yq -r '.apt_packages[]' config.yaml 2>/dev/null)"
if [[ -n "$APT_PACKAGES" ]]; then
  sudo apt update
  sudo apt upgrade
  sudo apt install $APT_PACKAGES
fi

SWAPFILE_SIZE="$(yq -r '.swapfile_size // ""' config.yaml)"
bash swapfile/install_swapfile.sh $SWAPFILE_SIZE
bash i3/install_i3.sh
bash bin/install_bin.sh
bash latex/install_latex.sh
bash autosuspend/install_autosuspend.sh
bash codex/install_codex.sh
bash terminal/install_terminal.sh
bash zsh/install_zsh.sh
VENV_LOCATION="$(yq -r '.venv_location // ""' config.yaml)"
DEFAULT_VENV_NAME="$(yq -r '.default_venv_name // ""' config.yaml)"
PIP_PACKAGES="$(yq -r '.pip_packages[]' config.yaml 2>/dev/null)"
bash python/install_python.sh "$VENV_LOCATION" "$DEFAULT_VENV_NAME" $PIP_PACKAGES
GIT_NAME="$(yq -r '.git_globals.name // ""' config.yaml)"
GIT_EMAIL="$(yq -r '.git_globals.email // ""' config.yaml)"
GIT_DEFAULT_BRANCH="$(yq -r '.git_globals.default_branch // ""' config.yaml)"
bash git/install_git.sh "$GIT_NAME" "$GIT_EMAIL" "$GIT_DEFAULT_BRANCH"
bash ssh/install_ssh.sh
bash vim/install_vim.sh
bash vscode/install_vscode.sh
