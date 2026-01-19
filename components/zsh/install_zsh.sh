#!/usr/bin/env bash

sudo apt install zsh
install "$(dirname -- "$0")/zshrc" "$HOME/.zshrc"
