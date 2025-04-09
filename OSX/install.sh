#!/usr/bin/env bash
set -e

echo "Activation du SUDO "
sudo -v

echo "Installation de Homebrew"
if ! type "brew" > /dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
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

echo "Ajout du cryptage gpg"
brew install gnupg2
mkdir ~/.gnupg
touch ~/.gnupg/gpg.conf
echo "no-greeting" >> ~/.gnupg/gpg.conf
echo "no-permission-warning" >> ~/.gnupg/gpg.conf
echo "lock-never" >> ~/.gnupg/gpg.conf
echo "keyserver hkp://pool.sks-keyservers.net" >> ~/.gnupg/gpg.conf
echo "keyserver-options timeout=10" >> ~/.gnupg/gpg.conf
echo "cert-digest-algo SHA256" >> ~/.gnupg/gpg.conf
echo "default-preference-list SHA512 SHA384 SHA256 SHA224 AES256 AES192 AES ZLIB BZIP2 ZIP Uncompressed" >> ~/.gnupg/gpg.conf

echo "Ajout du plugin gpg pour VIM"
mkdir -p ~/.vim/plugin
wget https://raw.githubusercontent.com/jamessan/vim-gnupg/master/plugin/gnupg.vim -O ~/.vim/plugin/gnupg.vim
echo "export GPG_TTY=\`tty\`" >> ~/.zshrc
source ~/.zshrc
