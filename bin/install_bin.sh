#!/usr/bin/env bash

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

mkdir ~/bin
cp $SCRIPT_DIR/bin/* ~/bin/
