#!/bin/sh
if command -v hyper >/dev/null; then
	if [ "$(uname -s)" = "Darwin" ]; then
		HTOP_HOME="$HOME/Library/Application Support/htop"
	else
		HTOP_HOME="$HOME/.config/htop"
	fi

	ln -sf "$DOTFILES/htop/htoprc" "$HTOP_HOME/htoprc"
fi