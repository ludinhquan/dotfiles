#!/bin/bash

DOTFILE=$HOME/dotfiles
SCRIPT=$DOTFILE/scripts/.local/bin

# Install package
sudo pacman -Syy
sudo pacman -S --noconfirm - < ~/dotfiles/programs/.pacman.default

bash $SCRIPT/install-yay.sh
bash $SCRIPT/install-font.sh

# xbanish: hide mouse cursor when typing
yay -S --answerclean All --answerdiff All xbanish
yay -S --answerclean All --answerdiff All google-chrome
yay -S --answerclean All --answerdiff All slack-desktop
yay -S --answerclean All --answerdiff All teams
yay -S --answerclean All --answerdiff All fnm-bin

# install nodejs and yarn
fnm install --lts
npm install --global yarn

# Create symlink
cd $HOME/dotfiles
stow alacritty awesome nvim picom ranger rofi tmux wallpapers x zsh scripts

sudo chsh -s "$(command -v zsh)" "${USER}"
