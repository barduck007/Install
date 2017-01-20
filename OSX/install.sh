#!/bin/sh
-e

echo "Activation du SUDO "
sudo -v

echo "Installation de Homebrew"

if ! type "brew" > /dev/null; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if ! type "/usr/local/bin/zsh" > /dev/null; then
  echo "Installation de zsh"
  brew install zsh
  echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells
  chsh -s /usr/local/bin/zsh
  echo "restart l'application de terminal pour finir l'install de zsh"
fi

