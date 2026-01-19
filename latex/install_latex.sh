#!/usr/bin/env bsh

sudo apt install texlive-latex-extra texworks
git clone git@github.com:julianrosen/latex.git ~/texmf
ln -s ~/texmf/templates ~/.local/share/TUG/TeXworks/templates
