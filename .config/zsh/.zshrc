[[ $commands[fnm] ]] && eval $(fnm env)
[[ -f /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)
[[ -f $HOME/.cargo/env ]] && source "$HOME/.cargo/env"

source $ZDOTDIR/config/zsh-options
source $ZDOTDIR/config/zsh-prompt
source $ZDOTDIR/config/zsh-plugins
source $ZDOTDIR/config/zsh-aliases
source $ZDOTDIR/config/zsh-functions
source $ZDOTDIR/config/zsh-vim-mode

zsh_add_file completions/docker.zsh
zsh_add_file .zshenv.local
