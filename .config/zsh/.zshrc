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
if [[ -x /opt/homebrew/opt/fnm/bin/fnm ]]; then
  eval "$(/opt/homebrew/opt/fnm/bin/fnm env --use-on-cd --shell zsh)"
elif [[ $commands[fnm] ]]; then
  eval "$(fnm env --use-on-cd --shell zsh)"
fi

export PATH=$HOME/.local/bin:$PATH:/usr/local/bin:$HOME/.cargo/bin:$HOME/.opencode/bin:$HOME/.bun/bin:$HOME/.config/local/bin

if command -v wt >/dev/null 2>&1; then eval "$(command wt config shell init zsh)"; fi
