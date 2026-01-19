#!/usr/bin/env bash

sudo apt install ssh

sudo install -m 0644 "$(dirname -- "$0")/10-no-password.conf" /etc/ssh/sshd_config.d/
