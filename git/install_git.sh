#!/usr/bin/env bash

NAME="$1"
EMAIL="$2"
DEFAULT_BRANCH="$3"

sudo apt install git

if [[ -n "$NAME" ]]; then
  git config --global user.name "$NAME"
fi
if [[ -n "$EMAIL" ]]; then
  git config --global user.email "$EMAIL"
fi
if [[ -n "$DEFAULT_BRANCH" ]]; then
  git config --global init.defaultBranch "$DEFAULT_BRANCH"
fi
