#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# Red prompt with the current user at first, followed by two pipes and the current path
# More docs about that:
# - https://doc.ubuntu-fr.org/zsh
# - http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html
PS1=$'\e[0;31m%n||%~$ \e[0m'

