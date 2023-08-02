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
    ranger
    mongosh
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

ln -s ~/dotfiles/.config/ ~/.config
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.gitconfig ~/.gitconfig

#<----------------Changing MacOS Specific Preferences-------------------->
defaults write com.apple.dock autohide-time-modifier -int 0 #Sets Dock Autohide Time to O Seconds
defaults write com.apple.dock autohide -bool true #Turns Dock Autohide ON
defaults write com.apple.dock magnification -bool  NO #Turns of Dock Magnification
defaults write com.apple.dock orientation -string  left #Moving the Dock to the left Side of the Screen
defaults write com.apple.dock minimize-to-application -bool YES #Minimizing Applications to Their Respective Application Icon
defaults write com.apple.dock showhidden -string  YES #Shows Hidden Applications in Dock
defaults write com.apple.dock expose-animation-duration -string 0 #Setting Expose Animation to 0 Seconds
defaults write com.apple.dock tilesize -int 36 #Setting Icon Size to 36 Pixels
defaults write com.apple.dock mineffect -string "genie" #Changes Minimize to Dock Animation to "Genie" (Seems to be the fastest by my eye)
defaults write com.apple.dock launchanim -bool false #Setting Launch Animation to False

defaults write -g InitialKeyRepeat -int 12
defaults write -g KeyRepeat -int 2

killall dock

echo 'Installation Complete'
echo 'Now you can make an SSH key:'
echo "Press CONTROL+C, if you don't want to"

ssh-keygen -t  ecdsa -b 521
