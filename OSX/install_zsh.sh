#!/usr/local/bin/zsh
-e

if [ ! -d "$HOME/.zprezto" ]; then
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
  setopt EXTENDED_GLOB
  for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    cp -ivn "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  done
fi

if [ ! -f "$HOME/.zshrc" ]; then
  ln -s "$HOME/dotfiles/zsh/zshrc" "$HOME/.zshrc"
fi
