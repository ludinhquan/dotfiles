#!/bin/bash

TMP=$HOME/tmp
[ ! -d $TMP ] && mkdir $TMP
cd $TMP

if [ ! -d $TMP/nerd-fonts ] 
then
  git clone --filter=blob:none --sparse https://github.com/ryanoasis/nerd-fonts
fi

cd $TMP/nerd-fonts

git sparse-checkout add patched-fonts/FiraCode
git sparse-checkout add patched-fonts/Hack

bash install.sh FiraCode
bash install.sh Hack
