#!/bin/bash

DOTFILE=$HOME/dotfiles
SCRIPT=$DOTFILE/scripts

# Install package
sudo pacman -Syy
sudo pacman -S --noconfirm - < ~/dotfiles/programs/.pacman.default

bash $SCRIPT/install-yay.sh
bash $SCRIPT/install-font.sh

# xbanish: hide mouse cursor when typing
yay -S --answerclean None --answerdiff None xbanish
yay -S --answerclean None --answerdiff None brave-browser
yay -S --answerclean None --answerdiff None slack-desktop
yay -S --answerclean None --answerdiff None teams
yay -S --answerclean None --answerdiff None fnm-bin
yay -S --answerclean None --answerdiff None mani
yay -S --answerclean None --answerdiff None openvpn3
yay -S --answerclean None --answerdiff None spotify-tui

# Create symlink
cd $HOME/dotfiles

ln -sfn ~/dotfiles/.config/ ~/.config
ln -sfn ~/dotfiles/.scripts/ ~/.scripts
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig

sudo chsh -s "$(command -v zsh)" "${USER}"

zsh

# install nodejs and yarn
fnm install --lts
npm install --global yarn
