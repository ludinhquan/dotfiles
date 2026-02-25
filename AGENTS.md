# AGENTS.md — Dotfiles Repository

## Overview

Personal dotfiles for **Lu Dinh Quan**. Manages configurations for macOS (primary) and Linux (Arch, Ubuntu). Configs are symlinked into `$HOME` — either via GNU `stow` or direct `ln -sfn` commands in setup scripts.

**Key principle**: This repo IS the user's `~/.config` (symlinked). Changes here are live immediately.

## Repository Structure

```
.config/           # App configs (symlinked to ~/.config)
  alacritty/       # Alacritty terminal (toml)
  awesome/         # Awesome WM (Linux)
  ghostty/         # Ghostty terminal
  hammerspoon/     # macOS automation
  karabiner.edn/   # Keyboard remapping (Goku/Karabiner)
  nvim/            # Neovim (Lua — init.lua → core + plugins)
  opencode/        # OpenCode AI agent config (JSON)
  ranger/          # File manager
  rofi/            # App launcher (Linux)
  skhd/            # Hotkey daemon (macOS)
  starship/        # Cross-shell prompt (toml)
  tmux/            # Tmux config + TPM plugins
  wezterm/         # WezTerm terminal
  yabai/           # Tiling WM (macOS)
  zsh/             # Zsh config (modular — see below)
.gitconfig         # Git user config (editor: nvim)
.zshenv            # Env vars, XDG dirs, ZDOTDIR, fzf defaults
.profile           # Sources .zshenv
.scripts/          # Setup & install scripts (bash)
.rgignore          # Ripgrep ignore rules
Makefile           # Minimal — mostly commented out
programs/          # Package lists (.pacman.default)
x/                 # X11 configs (.xinitrc, .xprofile, .Xresources)
```

## Build / Lint / Test Commands

**There are no build, lint, or test commands.** This is a dotfiles repo — plain config files, shell scripts, and Lua. No CI pipeline.

### Setup Commands

```bash
# macOS full setup (Homebrew, apps, symlinks, key repeat)
bash .scripts/setup-macos.sh

# Ubuntu setup (apt, Docker, Kubernetes, fnm)
bash .scripts/setup-ubuntu.sh

# Arch Linux setup (pacman, yay, fonts, symlinks)
bash .scripts/setup.sh
```

### Symlink Strategy

The setup scripts create symlinks directly — NOT via `stow` (despite README mentioning it):

```bash
ln -sfn ~/dotfiles/.config ~/.config    # Entire .config dir
ln -sf  ~/dotfiles/.zshenv ~/.zshenv
ln -sf  ~/dotfiles/.gitconfig ~/.gitconfig
```

The `.gitignore` whitelists specific `.config/` subdirectories to track. Everything else under `.config/` is ignored.

### Validating Changes

- **Zsh config**: Open a new terminal or `source $ZDOTDIR/.zshrc`
- **Tmux config**: `tmux source-file ~/.config/tmux/tmux.conf` or `prefix + r`
- **Neovim config**: Restart nvim or `:source %` on Lua files
- **Yabai/skhd**: `yabai --restart-service` / `skhd --restart-service`
- **Starship**: Changes apply on next prompt render (instant)

## Code Style Guidelines

### Shell Scripts (.sh files)

- Shebang: `#!/bin/bash` or `#!/usr/bin/env bash`
- Variables: `UPPER_SNAKE_CASE` for constants/env vars (e.g., `DOTFILE`, `TMP`, `SCRIPT`)
- No `set -euo pipefail` — scripts are informal/imperative
- Conditional directory creation: `[ ! -d $DIR ] && mkdir $DIR`
- Idempotent clones: `if [ ! -d $DIR ]; then git clone ...; fi`
- No quoting discipline — paths assume no spaces (home dir convention)

### Zsh Configuration (.config/zsh/)

- Modular layout: `.zshrc` sources files from `config/` subdirectory
- Config files are plain names (no extensions): `zsh-aliases`, `zsh-functions`, `zsh-options`, `zsh-plugins`, `zsh-prompt`, `zsh-vim-mode`, `zsh-kubectl`
- Completions stored in `completions/` with `.zsh` extension
- Local overrides via `.zshenv.local` (gitignored)
- Lazy-load pattern: `[[ $commands[tool] ]] && eval $(tool env)`
- PATH appended at end of `.zshrc`, colon-separated

### Neovim Configuration (.config/nvim/)

- Entry point: `init.lua` — branches on `vim.g.vscode` for VS Code compatibility
- Module structure: `require("core")` and `require("plugins")` under `lua/`
- Indentation: tabs in `init.lua`
- Plugin manager: Lazy.nvim (evidenced by `lazy-lock.json`)

### Tmux Configuration (.config/tmux/)

- Prefix: `C-a` (not default `C-b`)
- Vi mode keys enabled
- Plugin manager: TPM (Tmux Plugin Manager)
- Theme: Catppuccin (custom fork)
- Comments: inline `#` comments with descriptions
- Base index: 1 (not 0) for both windows and panes
- Status bar: top position

### Git Configuration

- Editor: `nvim`
- Credential helper: GitHub CLI (`gh auth git-credential`)
- User: Lu Dinh Quan <ludinhquan@gmail.com>

### General Conventions

- **Config format preference**: TOML for terminal emulators (Alacritty, Starship), Lua for Neovim, plain text for shell configs, JSON for OpenCode
- **No trailing newline enforcement** — files vary
- **Comments**: descriptive but terse; explain "why" or label sections
- **Indentation**: tabs in Lua/Makefile, 2 spaces in shell scripts (inconsistent — some use tabs)
- **File naming**: lowercase, hyphen-separated for scripts; dotfile convention for configs

## Environment

- **Shell**: Zsh (default shell, config in `$XDG_CONFIG_HOME/zsh`)
- **XDG compliance**: `XDG_CONFIG_HOME=$HOME/.config`, `XDG_DATA_HOME`, `XDG_CACHE_HOME` set in `.zshenv`
- **Editor**: `$EDITOR` and `$VISUAL` both set to `nvim`
- **Node**: Managed via `fnm` (Fast Node Manager)
- **Rust**: Cargo env sourced if present
- **Search**: `rg` (ripgrep) as default for `fzf` file finding
- **PATH additions**: `/usr/local/bin`, `~/.cargo/bin`, `~/.opencode/bin`, `~/.bun/bin`, `~/.config/local/bin`

## Critical Warnings

1. **This repo is live.** The `.config/` directory IS the user's actual config. Edits take effect immediately for most tools.
2. **Do not add secrets.** The `.config/opencode/opencode.json` contains a local API key for a localhost proxy — this is intentional. Do not add real API keys or credentials.
3. **Respect the .gitignore whitelist.** Only explicitly un-ignored `.config/` subdirectories are tracked. Do not add new `.config/` dirs without updating `.gitignore`.
4. **No stow in practice.** Despite the README mentioning `stow`, the actual setup scripts use direct `ln -sfn` symlinks. Do not assume stow-compatible directory structure.
5. **macOS is primary.** Homebrew paths (`/opt/homebrew/`), skhd, yabai, Hammerspoon, and Karabiner are macOS-specific. Linux configs (Awesome WM, rofi, X11) exist but may be stale.
6. **Tmux plugins are gitignored.** `.config/tmux/plugins` is in `.gitignore` — managed by TPM at runtime.
