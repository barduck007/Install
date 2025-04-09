#!/usr/bin/env bash
set -e

mkdir -p ~/.atom
ln -s $(pwd)/keymap.cson ~/.atom/keymap.cson

apm install compare-files
apm install split-diff
