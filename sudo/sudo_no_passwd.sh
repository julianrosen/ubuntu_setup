#!/usr/bin/env bash
sudoers_file="/etc/sudoers.d/90-$USER-nopasswd"
tmp="$(mktemp)"

# Minimal rule: allow this user to run anything via sudo without a password
printf '%s\n' "$USER ALL=(ALL:ALL) NOPASSWD:ALL" > "$tmp"

# Validate syntax before installing
sudo visudo -cf "$tmp"

# Install with correct owner/perms (sudo requires 0440)
sudo install -o root -g root -m 0440 "$tmp" "$sudoers_file"
rm -f "$tmp"

echo "Installed: $sudoers_file (NOPASSWD for user: $USER)"

