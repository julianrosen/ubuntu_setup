#!/usr/bin/env bash

SCRIPT_DIR="$(dirname -- "$0")"

sudo apt install autosuspend playerctl caffeine
sed "s/@USER@/$USER/g" "$SCRIPT_DIR/autosuspend.conf.in" | sudo tee /etc/autosuspend.conf >/dev/null

# Reload autosuspend to pick up config changes.
sudo systemctl restart autosuspend


# Add the update_playing cron entry if it is not already present.
CRON_LINE="*/2 * * * * $HOME/bin/update_playing"
if ! crontab -l 2>/dev/null | grep -qxF "$CRON_LINE"; then
  (crontab -l 2>/dev/null; echo "$CRON_LINE") | crontab -
fi
mkdir -p $HOME/.playing
