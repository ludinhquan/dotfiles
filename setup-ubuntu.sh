#!/bin/bash

# Update system
sudo apt update
sudo apt install docker.io zsh fzf ripgrep stow gh unzip

sudo chmod 666 /var/run/docker.sock

# Create symlink
cd ~
git clone https://github.com/ludinhquan/dotfiles
cd ~/dotfiles

stow zsh
sudo chsh -s "$(command -v zsh)" "${USER}"

# Install Minikube
echo "Installing Minikube"
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube

# Install Kubernetes
echo "Installing Kubernetes"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Install Helm 
echo "Installing Helm"
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

# Install Tilt
echo "Installing Tilt"
curl -fsSL https://raw.githubusercontent.com/tilt-dev/tilt/master/scripts/install.sh | bash

# Install fnm
curl -fsSL https://fnm.vercel.app/install | bash

zsh

# Install nodejs and yarn
fnm install --lts
npm install --global yarn
