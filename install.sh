#!/usr/bin/env bash

SOURCE="https://github.com/cryoW0lf/dotfiles"
TARGET="$HOME/.dotfiles"

if `command -v git >/dev/null 2>&1`; then
	echo "Installing the dotfiles..."
	mkdir -p "$TARGET"
	git clone "$SOURCE" "$TARGET"
else
	echo "Git is not installed, aborting...."
fi
