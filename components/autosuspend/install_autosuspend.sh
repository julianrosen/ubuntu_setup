#!/usr/bin/env bash

SCRIPT_DIR="$(dirname -- "$0")"

sudo apt install autosuspend playerctl caffeine
sed "s/@USER@/$USER/g" "$SCRIPT_DIR/autosuspend.conf.in" | sudo tee /etc/autosuspend.conf >/dev/null


sed "s/@USER@/$USER/g" "$SCRIPT_DIR/update_playing_crontab.in" | crontab
mkdir $HOME/.playing
