#!/usr/bin/env bash

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

dconf load /org/gnome/terminal/legacy/profiles:/ < $SCRIPT_DIR/gnome_terminal_profile.dconf
dconf load /org/gnome/terminal/legacy/keybindings/ < $SCRIPT_DIR/gnome_terminal_keybindings.dconf
