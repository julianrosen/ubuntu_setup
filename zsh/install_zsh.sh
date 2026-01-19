#!/usr/bin/env bash

SCRIPT_DIR="$(dirname -- "$0")"

sudo apt install zsh
install $SCRIPT_DIR/zshrc $HOME/.zshrc
