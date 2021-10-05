#!/bin/zsh

###############################
# EXPORT ENVIRONMENT VARIABLE #
###############################

export TERMINAL="alacritty"
export DOTFILES="$HOME/dotfiles"

# editor
export EDITOR="nvim"
export VISUAL="nvim"

#browser
export BROWSER="brave"

# XDG Paths
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_LOCAL_BIN=$HOME/.local/bin

# zsh
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export HISTFILE=$HOME/.zhistory    # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file

# PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.fnm:$PATH

# fzf
export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
