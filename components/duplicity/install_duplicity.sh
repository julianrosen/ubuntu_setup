#!/usr/bin/env bash

SCRIPT_DIR="$(dirname -- "$0")"
BACKUP_DIR_REL="$1"
SOURCES_REL=("${@:2}")

sudo apt install duplicity

# Install the user-level systemd units.
mkdir -p "$HOME/.config/systemd/user"
install -m 0644 "$SCRIPT_DIR/backup.service" "$HOME/.config/systemd/user/"
install -m 0644 "$SCRIPT_DIR/backup.timer" "$HOME/.config/systemd/user/"

# Write an env file with absolute paths for the backup script.
BACKUP_DIR="$HOME/$BACKUP_DIR_REL"
BACKUP_SOURCES=""
for rel in "${SOURCES_REL[@]}"; do
  BACKUP_SOURCES="$BACKUP_SOURCES $HOME/$rel"
done
BACKUP_SOURCES="${BACKUP_SOURCES# }"

cat <<EOF > "$HOME/.config/systemd/user/backup.env"
BACKUP_DIR=$BACKUP_DIR
BACKUP_SOURCES=$BACKUP_SOURCES
EOF

# Install the backup script and enable the timer.
mkdir -p "$HOME/bin"
install -m 0755 "$SCRIPT_DIR/backup" "$HOME/bin/"

systemctl --user daemon-reload
systemctl --user enable --now backup.timer
