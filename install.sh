#!/usr/bin/env bash

sudo apt install yq

bash components/sudo/sudo_no_passwd.sh

APT_PACKAGES="$(yq -r '.apt_packages[]' config.yaml 2>/dev/null)"
if [[ -n "$APT_PACKAGES" ]]; then
  sudo apt update
  sudo apt upgrade
  sudo apt install $APT_PACKAGES
fi

SWAPFILE_SIZE="$(yq -r '.swapfile_size // ""' config.yaml)"
bash components/swapfile/install_swapfile.sh $SWAPFILE_SIZE
bash components/i3/install_i3.sh
bash components/bin/install_bin.sh
bash components/latex/install_latex.sh
bash components/autosuspend/install_autosuspend.sh
DUPLICITY_BACKUP_DIR="$(yq -r '.duplicity_backup_dir // ""' config.yaml)"
DUPLICITY_BACKUP_SOURCES="$(yq -r '.duplicity_backup_sources[]' config.yaml 2>/dev/null)"
bash components/duplicity/install_duplicity.sh "$DUPLICITY_BACKUP_DIR" $DUPLICITY_BACKUP_SOURCES
bash components/codex/install_codex.sh
bash components/terminal/install_terminal.sh
bash components/zsh/install_zsh.sh
VENV_LOCATION="$(yq -r '.venv_location // ""' config.yaml)"
DEFAULT_VENV_NAME="$(yq -r '.default_venv_name // ""' config.yaml)"
PIP_PACKAGES="$(yq -r '.pip_packages[]' config.yaml 2>/dev/null)"
bash components/python/install_python.sh "$VENV_LOCATION" "$DEFAULT_VENV_NAME" $PIP_PACKAGES
GIT_NAME="$(yq -r '.git_globals.name // ""' config.yaml)"
GIT_EMAIL="$(yq -r '.git_globals.email // ""' config.yaml)"
GIT_DEFAULT_BRANCH="$(yq -r '.git_globals.default_branch // ""' config.yaml)"
bash components/git/install_git.sh "$GIT_NAME" "$GIT_EMAIL" "$GIT_DEFAULT_BRANCH"
bash components/ssh/install_ssh.sh
bash components/vim/install_vim.sh
bash components/vscode/install_vscode.sh
