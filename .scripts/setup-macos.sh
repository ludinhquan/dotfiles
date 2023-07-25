#!/usr/bin/env bash

echo 'What is your username on this system?'
read uname

sudo -v #Give sudo privileges ahead of time, so that we hopefully only have to enter a password once
cd ~ #Moving to home directory at the beginning of the process

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

#<----------------Installing MacOS Apps, via Homebrew, Caks, & The App Store-------------------->
brew=(
    fnm
    fzf
    gh
    go
    htop
    ilmbase
    imagemagick
    jq
    lazygit
    neovim
    ripgrep
    tmux
    yabai
)
cask=(
    alacritty
    brave-browser
    firefox
    font-hack-nerd-font
    keycastr
    lastpass
    slack
    spotify
    tor-browser
    virtualbox
    vlc
) #GUI apps that install with cask


brew update
brew upgrade

brew install ${brew[@]} #Homebrew App Installer
brew install ${cask[@]} --cask #Casks Installer

ln -s ~/Repos/dotfiles/.config/ ~/.config
ln -s ~/Repos/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/Repos/dotfiles/.profile ~/.profile
ln -s ~/Repos/dotfiles/.gitconfig ~/.gitconfig

#<----------------Changing MacOS Specific Preferences-------------------->
defaults write -g InitialKeyRepeat -int 12
defaults write -g KeyRepeat -int 2

echo 'Installation Complete'
echo 'Now you can make an SSH key:'
echo "Press CONTROL+C, if you don't want to"

ssh-keygen -t  ecdsa -b 521
