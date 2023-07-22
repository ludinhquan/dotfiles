#!/bin/bash

TMP=$HOME/tmp
[ ! -d $TMP ] && mkdir $TMP
cd $TMP

if [ ! -d yay ] 
then
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si
fi

cd $HOME
