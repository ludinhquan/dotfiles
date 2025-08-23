#!/usr/bin/env bash

echo 'What is your username on this system?'
read uname

sudo -v #Give sudo privileges ahead of time, so that we hopefully only have to enter a password once
cd ~ #Moving to home directory at the beginning of the process

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

eval $(/opt/homebrew/bin/brew shellenv)

#<----------------Installing MacOS Apps, via Homebrew, Caks, & The App Store-------------------->
brew=(
    fnm
    fzf
    gh
    htop
    jq
    lazygit
    neovim
    ripgrep
    ranger
    raycast
    yqrashawn/goku/goku
)

cask=(
    alacritty
    arc
    firefox
) #GUI apps that install with cask

brew update
brew upgrade

brew install ${brew[@]} #Homebrew App Installer
brew install ${cask[@]} --cask #Casks Installer

ln -sfn ~/dotfiles/.config ~/.config
ln -sf ~/dotfiles/.zshenv ~/.zshenv

defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1
defaults write -g ApplePressAndHoldEnabled 0

killall dock

ssh-keygen -t  ecdsa -b 521

echo 'Installation Complete'
echo 'Now you can make an SSH key:'
echo "Press CONTROL+C, if you don't want to"

