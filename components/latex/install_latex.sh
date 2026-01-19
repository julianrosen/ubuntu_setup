#!/usr/bin/env bash

sudo apt install texlive-latex-extra texworks
git clone git@github.com:julianrosen/latex.git $HOME/texmf
ln -s $HOME/texmf/templates $HOME/.local/share/TUG/TeXworks/templates
