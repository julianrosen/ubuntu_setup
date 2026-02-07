#!/usr/bin/env bash

SCRIPT_DIR="$(dirname -- "$0")"

dconf load /org/gnome/terminal/legacy/profiles:/ < $SCRIPT_DIR/gnome_terminal_profile.dconf
dconf load /org/gnome/terminal/legacy/keybindings/ < $SCRIPT_DIR/gnome_terminal_keybindings.dconf
gsettings set org.gnome.Terminal.Legacy.Settings default-show-menubar false

