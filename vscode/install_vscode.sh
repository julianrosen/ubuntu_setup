#!/usr/bin/env bash

SCRIPT_DIR="$(dirname -- "$0")"

sudo snap install code --classic
cp $SCRIPT_DIR/settings.json $HOME/.config/Code/User/
