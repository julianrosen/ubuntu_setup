#!/usr/bin/env bash

sudo apt install texlive-latex-extra texworks
LATEX_REPO_DIR="$(dirname -- "$0")/../../../latex"

if [[ ! -d "$LATEX_REPO_DIR" ]]; then
  echo "Please clone the latex repo next to this repo (expected at: $LATEX_REPO_DIR)."
  exit 1
fi

mkdir -p "$HOME/texmf"

ln -s "$LATEX_REPO_DIR/bibtex" "$HOME/texmf/bibtex"
ln -s "$LATEX_REPO_DIR/tex" "$HOME/texmf/tex"

ln -s "$LATEX_REPO_DIR/templates" "$HOME/.local/share/TUG/TeXworks/templates"
