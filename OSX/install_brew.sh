#!/usr/bin/env bash
set -e

brew update
brew upgrade
brew cleanup

brew tap homebrew/core
brew tap caskroom/cask
brew tap caskroom/versions

brew install zsh
brew install git
brew install wget
brew install vim
brew install gnupg
brew install node
brew install yarn

# apps
brew install dropbox
brew install spotify
brew install slack
brew install iterm2
brew install vlc
brew install atom
brew install google-chrome
brew install phpstorm

# Docker & utilities
brew install docker
brew install lazydocker

# Kubernetes client et k9s pour manager son cluster Kubernetes
brew install kubectl
brew install derailed/k9s/k9s

## Usage stats network / cpu /ram
brew install yujitach-menumeters
## VPN client
brew install tunnelblick
## SSH tunnel manager
brew install ssh-tunnel-manager
