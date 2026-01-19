#!/usr/bin/env bash

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

sudo snap install code --classic
cp $SCRIPT_DIR/settings.json ~/.config/Code/User/
