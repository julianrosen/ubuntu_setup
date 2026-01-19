#!/usr/bin/env bash

SCRIPT_DIR="$(dirname -- "$0")"

sudo apt install autosuspend playerctl caffeine
sed "s/@USER@/$USER/g" $SCRIPT_DIR/autosuspend.conf.in > $SCRIPT_DIR/autosuspend.conf
sudo install $SCRIPT_DIR/autosuspend.conf  /etc/ -g root -o root -m 644
rm $SCRIPT_DIR/autosuspend.conf


sed "s/@USER@/$USER/g" $SCRIPT_DIR/update_playing_crontab.in > $SCRIPT_DIR/update_playing_crontab
crontab $SCRIPT_DIR/update_playing_crontab
rm $SCRIPT_DIR/update_playing_crontab
mkdir $HOME/.playing
