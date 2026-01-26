#!/usr/bin/env bash
set -e

apt update
apt upgrade

sudo apt install build-essential procps curl file git ca-certificates vim

git config --global core.editor "vim"

#############################################
############## Ghostty et ZSH ###############

# Installation de ZSH et Oh-my-ZSH
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Installation de Ghostty (Terminal Ubuntu)
sudo /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/mkasberg/ghostty-ubuntu/HEAD/install.sh)"
ln -sf $(pwd)/ghostty-configuration.conf ~/.config/ghostty/config

# Keymap options list: https://ghostty.org/docs/config/reference#command

#############################################

##########################################################
############## Homebrew et ses dépendances ###############

# Installation de Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.bashrc
echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.zshrc

# Installation de Lazydocker
brew install lazydocker

# Installation de sops (équivalent de GPG pour chiffrer/déchiffrer des fichiers)
brew install sops

# Installation de act (utilitaire pour jouer des github actions en local avec Docker)
brew install act
##########################################################

##########################################################
############## Snap et ses dépendances ###############

# Installation de Spotify
sudo snap install spotify

# Installation de Slack
sudo snap install slack

# Installation de OpenTofu (Terraform like)
sudo snap install --classic opentofu

##########################################################

###########################################
############ GCP API + Plugins ############
# Installation du Google Cloud CLI
sudo apt-get install apt-transport-https ca-certificates gnupg curl
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
sudo apt-get update && sudo apt-get install google-cloud-cli

# Installation du plugin Cloud SQL Proxy
# Cf. https://github.com/GoogleCloudPlatform/cloud-sql-proxy
curl "https://storage.googleapis.com/cloud-sql-connectors/cloud-sql-proxy/v2.20.0/cloud-sql-proxy.linux.amd64" -o cloud-sql-proxy
chmod +x cloud-sql-proxy
sudo mv cloud-sql-proxy /usr/local/bin/
sudo apt install postgresql-client
###########################################

##########################################################
################# Installation de Docker #################
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Signed-By: /etc/apt/keyrings/docker.asc
EOF
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
##########################################################

# Installation de Netbird VPN
curl -fsSL https://pkgs.netbird.io/install.sh | sh

# Rclone pour monter un volume Google Drive
sudo apt install rclone
rclone config
mkdir ~/Google_Drive
# Pour monter le volume dans le dossier ~/Google_Drive:
# $ rclone mount Google_Drive:/ ~/Google_Drive

# Installation de Sublime Text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo tee /etc/apt/keyrings/sublimehq-pub.asc > /dev/null
echo -e 'Types: deb\nURIs: https://download.sublimetext.com/\nSuites: apt/stable/\nSigned-By: /etc/apt/keyrings/sublimehq-pub.asc' | sudo tee /etc/apt/sources.list.d/sublime-text.sources
sudo apt update
sudo apt install sublime-text

# Pour ajouter les fonctions de play/pause - Chanson précédente/suivante sur le clavier du PC Dell:
sudo apt install playerctl
# Les commandes en ligne de commande sont:
# playerctl play-pause   # Play/Pause
# playerctl next         # Chanson suivante
# playerctl previous     # Chanson précédente
# playerctl stop         # Stop


# Pour ajouter l'autocomplétion Kubectl, ajouter la ligne suivante dans bashrc:
echo "source <(kubectl completion bash)" >> ~/.zshrc
echo "source <(kubectl completion bash)" >> ~/.bashrc

cat .zshrc >> ~/.bashrc