#!/bin/bash

TMP=$HOME/tmp
[ ! -d $TMP ] && mkdir $TMP
cd $TMP

if [ ! -d nerd-fonts ] 
then
  git clone --filter=blob:none --sparse git@github.com:ryanoasis/nerd-fonts
fi

cd nerd-fonts
git sparse-checkout add patched-fonts/FiraCode
git sparse-checkout add patched-fonts/Hack

bash install.sh FiraCode
bash install.sh Hack
