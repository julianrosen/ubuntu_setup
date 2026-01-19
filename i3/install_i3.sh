#!/usr/bin/env bash

SCRIPT_DIR="$(dirname -- "$0")"

sudo apt install i3 i3blocks compton numlockx hsetroot wmctrl curl
install -D $SCRIPT_DIR/i3_config $HOME/.config/i3/config
install -D $SCRIPT_DIR/i3blocks_config $HOME/.config/i3blocks/config


# Ran into an issue with i3 crashing because of some
# Gnome stuff that tries to load
mkdir -p $HOME/.config/systemd/user
systemctl --user mask \
  gnome-session.target \
  gnome-session-pre.target \
  gnome-session-wayland.target \
  gnome-session-x11.target


# Adjust GDM so that it shows login options
FILE=/etc/gdm3/custom.conf

# Uncomment if commented
sudo sed -i 's/^[[:space:]]*#[[:space:]]*WaylandEnable=false/WaylandEnable=false/' "$FILE"

# Add if missing
sudo grep -q '^[[:space:]]*WaylandEnable=false' "$FILE" || \
    echo 'WaylandEnable=false' | sudo tee -a "$FILE" >/dev/null

# Had a problem with NVIDIA driver
DRIVER="$(ubuntu-drivers devices | awk '/recommended/ && /nvidia-driver-/{print $3; exit}')"

echo "Installing: $DRIVER"
sudo apt update
sudo apt install -y "$DRIVER"
