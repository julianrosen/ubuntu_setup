#!/usr/bin/env bash

SCRIPT_DIR="$(dirname -- "$0")"

mkdir $HOME/bin
cp $SCRIPT_DIR/bin/* $HOME/bin/
