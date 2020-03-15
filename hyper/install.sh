#!/bin/sh
if command -v hyper >/dev/null; then
	if [ "$(uname -s)" = "Darwin" ]; then
		HYPER_HOME="$HOME/Library/Application Support/Hyper"
	else
		HYPER_HOME="$HOME/.config/Hyper"
	fi

	ln -sf "$DOTFILES/hyper/.hyper.js" "$HYPER_HOME/.hyper.js"
fi