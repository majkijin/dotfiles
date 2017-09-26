#!/usr/bin/env bash

# Get current dir (so run this script from anywhere)
export DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Update dotfiles itself first
[ -d "$DOTFILES_DIR/.git" ] && git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master

# Bunch of symlinks
ln -sfv "$DOTFILES_DIR/vim/.vimrc" ~
ln -sfv "$DOTFILES_DIR/vim/.vim" ~
ln -sfv "$DOTFILES_DIR/bash/.bash_aliases" ~
ln -sfv "$DOTFILES_DIR/bash/.dircolors" ~
ln -sfv "$DOTFILES_DIR/emacs/.spacemacs" ~

# Use GNU stow to install stuff under home directory. This is used for
# directories like ~/bin/. TODO: Only experimental, not used yet actually!!!
for f in `find . -maxdepth 1 -mindepth 1 -type d -a \! -iname ".*" | cut -f2 -d/`; do
    echo stow $f;
done

if [ "$(uname)" == "Darwin" -a -f "$DOTFILES_DIR/install/osx.sh" ]; then
    source "$DOTFILES_DIR/install/osx.sh"
fi
