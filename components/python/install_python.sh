#!/usr/bin/env bash

VENV_DIR_REL="${1:-.venvs}"
ENV_NAME="${2:-general}"
PIP_PACKAGES=("${@:3}")

VENV_DIR="$HOME/$VENV_DIR_REL"
mkdir -p "$VENV_DIR"
sudo apt install python3-pip python3-venv
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 1
if [[ ! -d "$VENV_DIR/$ENV_NAME" ]]; then
  python -m venv "$VENV_DIR/$ENV_NAME"
fi
LINE="source $VENV_DIR/$ENV_NAME/bin/activate"
if ! grep -qxF "$LINE" "$HOME/.zshrc"; then
  echo "$LINE" >> "$HOME/.zshrc"
fi
source "$VENV_DIR/$ENV_NAME/bin/activate"
pip install "${PIP_PACKAGES[@]}"
