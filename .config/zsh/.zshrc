[[ $commands[fnm] ]] && eval $(fnm env)
[[ -f /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)
[[ -f $HOME/.cargo/env ]] && source "$HOME/.cargo/env"

source $ZDOTDIR/config/zsh-options
source $ZDOTDIR/config/zsh-prompt
source $ZDOTDIR/config/zsh-plugins
source $ZDOTDIR/config/zsh-aliases
source $ZDOTDIR/config/zsh-functions
source $ZDOTDIR/config/zsh-vim-mode
source $ZDOTDIR/config/zsh-kubectl

zsh_add_file $ZDOTDIR/completions/docker.zsh
zsh_add_file $ZDOTDIR/completions/kubectl.zsh
zsh_add_file $ZDOTDIR/.zshenv.local

# fnm
FNM_PATH="/opt/homebrew/opt/fnm/bin"
if [ -d "$FNM_PATH" ]; then
  eval "`fnm env`"
fi

export PATH=$PATH:/usr/local/bin:$HOME/.cargo/bin:$HOME/.opencode/bin:$HOME/.bun/bin