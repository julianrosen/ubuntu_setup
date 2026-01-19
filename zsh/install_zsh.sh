#!/usr/bin/env bash

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

sudo apt install zsh
install $SCRIPT_DIR/zshrc ~/.zshrc

