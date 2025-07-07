#!/usr/bin/env bash
set -e

brew install spotify
brew install pipx
pipx install yt-dlp
pipx install spotdl

# Utile pour télécharger de grosses playlists.
#Cf:
# - https://github.com/spotDL/spotify-downloader/issues/1978#issuecomment-2441902909
# - https://github.com/spotDL/spotify-downloader/issues/2201#issuecomment-2441896485
ulimit -n 4096
