#!/bin/sh
-e

echo "Activation du SUDO "
sudo -v

echo "Installation de Homebrew"
if ! type "brew" > /dev/null; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if ! type "zsh" > /dev/null; then
  echo "Installation de zsh"
  . zsh/install.sh
fi

zsh ./zshinstall
