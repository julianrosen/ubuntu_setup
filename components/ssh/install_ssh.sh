#!/usr/bin/env bash

sudo apt install ssh

SCRIPT_DIR="$(dirname -- "$0")"

sudo install -m 0644 $SCRIPT_DIR/10-no-password.conf /etc/ssh/sshd_config.d/
