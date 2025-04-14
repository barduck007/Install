#!/usr/bin/env bash

brew install zsh
echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells
chsh -s /bin/zsh # Use zsh by default
echo "restart l'application de terminal pour finir l'install de zsh"
zsh

# Installation of Oh My Zsh (https://github.com/robbyrussell/oh-my-zsh)
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

cat $HOME/Projects/Install/OSX/zsh/zshrc >> $HOME/.zshrc
cat $HOME/Projects/Install/OSX/zsh/zsh_aliases >> $HOME/.zsh_aliases
