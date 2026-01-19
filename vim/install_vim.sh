#!/usr/bin/env bash

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

sudo apt install vim
sudo update-alternatives --set editor /usr/bin/vim.basic
sudo cp $SCRIPT_DIR/vimrc /etc/vim
