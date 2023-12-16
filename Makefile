setup:
	sudo apt update
	sudo apt install gh zsh fzf snapd
	snapd install microk8s

	# Change default shell
  sudo chsh -s /bin/zsh

	# Create symlinks
	cd ~/dotfiles
	.scripts/stow

