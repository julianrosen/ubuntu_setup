#!/usr/bin/env bash

sudo snap install code --classic
mkdir -p "$HOME/.config/Code/User"
cp "$(dirname -- "$0")/settings.json" "$HOME/.config/Code/User/"
