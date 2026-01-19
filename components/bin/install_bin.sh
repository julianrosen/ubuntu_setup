#!/usr/bin/env bash

mkdir $HOME/bin
install -m 0755 "$(dirname -- "$0")/bin/"* "$HOME/bin/"
