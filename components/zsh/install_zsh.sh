#!/usr/bin/env bash

sudo apt install zsh
if [[ -e "$HOME/.zshrc" ]]; then
  read -r -p "Overwrite existing $HOME/.zshrc? [y/N] " RESPONSE
  if [[ "$RESPONSE" != "y" && "$RESPONSE" != "Y" ]]; then
    exit 0
  fi
fi
install "$(dirname -- "$0")/zshrc" "$HOME/.zshrc"
