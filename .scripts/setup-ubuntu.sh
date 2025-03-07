#!/bin/bash

# Update system
sudo apt update
sudo apt install zsh gh


# Create symlink
cd ~
git clone https://github.com/ludinhquan/dotfiles
cd ~/dotfiles

sudo chsh -s "$(command -v zsh)" "${USER}"

# Install Docker
echo "Installing Docker"
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
rm get-docker.sh

sudo chmod 666 /var/run/docker.sock

# Install Kubernetes
echo "Installing Kubernetes"
ARCH=$(uname -m)
if [ "$ARCH" == "aarch64" ]; then
    # For ARM 64-bit architecture
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/arm64/kubectl"
else
    # For AMD64 architecture
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
fi
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/arm64/kubectl.sha256"
sudo install -o ${USER} -g ${USER} -m 0755 kubectl /usr/local/bin/kubectl

# Install Helm 
echo "Installing Helm"
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

# Install fnm
curl -fsSL https://fnm.vercel.app/install | bash
# Install nodejs and yarn
fnm install --lts
npm install --global yarn
