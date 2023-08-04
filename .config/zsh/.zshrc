[[ $commands[fnm] ]] && eval $(fnm env)
[[ $commands[brew] ]] && eval $(/opt/homebrew/bin/brew shellenv)

source $ZDOTDIR/config/zsh-options
source $ZDOTDIR/config/zsh-prompt
source $ZDOTDIR/config/zsh-plugins
source $ZDOTDIR/config/zsh-aliases
source $ZDOTDIR/config/zsh-functions
source $ZDOTDIR/config/zsh-vim-mode
source $ZDOTDIR/config/zsh-kubectl
