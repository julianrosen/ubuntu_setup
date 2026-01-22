#!/usr/bin/env bash

sudo apt install yq whiptail

OPTIONS=(
  sudo "Sudo no-password config" ON
  apt "Apt packages from config.yaml" ON
  swapfile "Swapfile" ON
  i3 "i3 window manager and config" ON
  bin "User bin scripts" ON
  latex "LaTeX setup" ON
  autosuspend "Autosuspend" ON
  duplicity "Duplicity backup timer" ON
  codex "OpenAI Codex CLI" ON
  terminal "GNOME Terminal profile" ON
  zsh "Zsh config" ON
  python "Python venv and packages" ON
  git "Git config" ON
  ssh "SSH server config" ON
  vim "Vim config" ON
  vscode "VS Code" ON
)

while true; do
  SELECTED=$(whiptail --title "Ubuntu Setup" --checklist "Select components to install" 0 0 0 "${OPTIONS[@]}" 3>&1 1>&2 2>&3)
  if [[ $? -ne 0 ]]; then
    exit 1
  fi

  SELECTED=${SELECTED//\"/}
  if [[ -z "$SELECTED" ]]; then
    whiptail --msgbox "No components selected." 0 0
    continue
  fi

  SUMMARY=""
  for item in $SELECTED; do
    SUMMARY+="- $item\n"
  done

  whiptail --yesno "Install the following components?\n\n$SUMMARY" 0 0 --yes-button "Install" --no-button "Back"
  if [[ $? -eq 0 ]]; then
    break
  fi
done

SELECTED_STR=" $SELECTED "

if [[ "$SELECTED_STR" == *" sudo "* ]]; then
  bash components/sudo/sudo_no_passwd.sh
fi

if [[ "$SELECTED_STR" == *" apt "* ]]; then
  APT_PACKAGES="$(yq -r '.apt_packages[]' config.yaml 2>/dev/null)"
  if [[ -n "$APT_PACKAGES" ]]; then
    sudo apt update
    sudo apt upgrade
    sudo apt install $APT_PACKAGES
  fi
fi

if [[ "$SELECTED_STR" == *" swapfile "* ]]; then
  SWAPFILE_SIZE="$(yq -r '.swapfile_size // ""' config.yaml)"
  bash components/swapfile/install_swapfile.sh $SWAPFILE_SIZE
fi

if [[ "$SELECTED_STR" == *" i3 "* ]]; then
  bash components/i3/install_i3.sh
fi

if [[ "$SELECTED_STR" == *" bin "* ]]; then
  bash components/bin/install_bin.sh
fi

if [[ "$SELECTED_STR" == *" latex "* ]]; then
  bash components/latex/install_latex.sh
fi

if [[ "$SELECTED_STR" == *" autosuspend "* ]]; then
  bash components/autosuspend/install_autosuspend.sh
fi

if [[ "$SELECTED_STR" == *" duplicity "* ]]; then
  DUPLICITY_BACKUP_DIR="$(yq -r '.duplicity_backup_dir // ""' config.yaml)"
  DUPLICITY_BACKUP_SOURCES="$(yq -r '.duplicity_backup_sources[]' config.yaml 2>/dev/null)"
  bash components/duplicity/install_duplicity.sh "$DUPLICITY_BACKUP_DIR" $DUPLICITY_BACKUP_SOURCES
fi

if [[ "$SELECTED_STR" == *" codex "* ]]; then
  bash components/codex/install_codex.sh
fi

if [[ "$SELECTED_STR" == *" terminal "* ]]; then
  bash components/terminal/install_terminal.sh
fi

if [[ "$SELECTED_STR" == *" zsh "* ]]; then
  bash components/zsh/install_zsh.sh
fi

if [[ "$SELECTED_STR" == *" python "* ]]; then
  VENV_LOCATION="$(yq -r '.venv_location // ""' config.yaml)"
  DEFAULT_VENV_NAME="$(yq -r '.default_venv_name // ""' config.yaml)"
  PIP_PACKAGES="$(yq -r '.pip_packages[]' config.yaml 2>/dev/null)"
  bash components/python/install_python.sh "$VENV_LOCATION" "$DEFAULT_VENV_NAME" $PIP_PACKAGES
fi

if [[ "$SELECTED_STR" == *" git "* ]]; then
  GIT_NAME="$(yq -r '.git_globals.name // ""' config.yaml)"
  GIT_EMAIL="$(yq -r '.git_globals.email // ""' config.yaml)"
  GIT_DEFAULT_BRANCH="$(yq -r '.git_globals.default_branch // ""' config.yaml)"
  bash components/git/install_git.sh "$GIT_NAME" "$GIT_EMAIL" "$GIT_DEFAULT_BRANCH"
fi

if [[ "$SELECTED_STR" == *" ssh "* ]]; then
  bash components/ssh/install_ssh.sh
fi

if [[ "$SELECTED_STR" == *" vim "* ]]; then
  bash components/vim/install_vim.sh
fi

if [[ "$SELECTED_STR" == *" vscode "* ]]; then
  bash components/vscode/install_vscode.sh
fi
