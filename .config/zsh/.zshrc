[[ $commands[fnm] ]] && eval $(fnm env)
[[ -f /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)

source $ZDOTDIR/config/zsh-options
source $ZDOTDIR/config/zsh-prompt
source $ZDOTDIR/config/zsh-plugins
source $ZDOTDIR/config/zsh-aliases
source $ZDOTDIR/config/zsh-functions
source $ZDOTDIR/config/zsh-vim-mode

zsh_add_file "completions/docker.zsh"

# pnpm
export PNPM_HOME="/Users/ldquan/.config/local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
