#!/bin/bash

DOTFILE=$HOME/dotfiles
SCRIPT=$DOTFILE/scripts/.local/bin

# Install package
sudo pacman -Syy
sudo pacman -S --noconfirm - < ~/dotfiles/programs/.pacman.default

bash $SCRIPT/install-yay.sh
bash $SCRIPT/install-font.sh

# xbanish: hide mouse cursor when typing
yay -S --answerclean None --answerdiff None xbanish
yay -S --answerclean None --answerdiff None brave
yay -S --answerclean None --answerdiff None slack-desktop
yay -S --answerclean None --answerdiff None teams
yay -S --answerclean None --answerdiff None fnm-bin
yay -S --answerclean None --answerdiff None mani

# Create symlink
cd $HOME/dotfiles

stow alacritty &
stow awesome &
stow nvim &
stow picom &
stow ranger &
stow rofi &
stow tmux &
stow wallpapers &
stow x &
stow zsh &
stow scripts &

sudo chsh -s "$(command -v zsh)" "${USER}"

zsh

# install nodejs and yarn
fnm install --lts
npm install --global yarn