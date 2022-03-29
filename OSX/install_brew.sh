#!/bin/sh
-e

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
brew install rambox # Skype, Whatsapp, messenger, ...
brew install iterm2
brew install vlc
brew install atom
brew install google-chrome
brew install phpstorm
brew install dashlane
brew install virtualbox
brew install filezilla

## Usage stats network / cpu /ram
brew install yujitach-menumeters
## VPN client
brew install tunnelblick
## SSH tunnel manager
brew install ssh-tunnel-manager

#brew cask install cloud
#brew cask install hammerspoon
#brew cask install grandperspective
#brew cask install limechat
#brew cask install postico
# required by some updates for brew
#brew cask install xquartz
#brew cask install sequel-pro
#brew cask install cyberduck
