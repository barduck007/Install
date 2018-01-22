#!/usr/bin/env bash
-e

echo "Activation du SUDO "
sudo -v

echo "Installation de Homebrew"
if ! type "brew" > /dev/null; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if ! type "zsh" > /dev/null; then
  echo "Installation de zsh"
  ./zsh/install.sh
fi

echo "Installation de Brew et des applications"
./install_brew.sh

echo "MAJ de Atom"
./atom/install.sh

echo "Création du gitignore global"
git config --global core.excludesfile ~/.gitignore_global
ln -s $(pwd)/git/gitignore ~/.gitignore_global
