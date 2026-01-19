#!/usr/bin/env bash

sudo snap install code --classic
cp "$(dirname -- "$0")/settings.json" "$HOME/.config/Code/User/"
