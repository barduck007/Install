#!/bin/sh
-e

brew update
brew upgrade
brew prune
brew cleanup

brew tap homebrew/dupes
brew tap homebrew/core
brew tap caskroom/cask
brew tap caskroom/versions

brew install zsh
brew install git
brew install wget
brew install vim
brew install node
brew install yarn

# apps

brew cask install dropbox
brew cask install spotify
brew cask install franz # slack, messenger, ...
brew cask install iterm2
brew cask install vlc
brew cask install atom
brew cask install google-chrome
brew cask install phpstorm
brew cask install dashlane
brew cask install virtualbox
brew cask install vagrant

## Usage stats network / cpu /ram
brew cask install yujitach-menumeters
## VPN client
brew cask install tunnelblick
## SSH tunnel manager
brew cask install ssh-tunnel-manager

#brew cask install cloud
#brew cask install hammerspoon
#brew cask install grandperspective
#brew cask install limechat
#brew cask install postico
# required by some updates for brew
#brew cask install xquartz
#brew cask install sequel-pro
#brew cask install cyberduck
