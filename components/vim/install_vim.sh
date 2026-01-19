#!/usr/bin/env bash

sudo apt install vim
sudo update-alternatives --set editor /usr/bin/vim.basic
sudo cp "$(dirname -- "$0")/vimrc" /etc/vim
