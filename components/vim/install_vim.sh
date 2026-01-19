#!/usr/bin/env bash

SCRIPT_DIR="$(dirname -- "$0")"

sudo apt install vim
sudo update-alternatives --set editor /usr/bin/vim.basic
sudo cp $SCRIPT_DIR/vimrc /etc/vim
