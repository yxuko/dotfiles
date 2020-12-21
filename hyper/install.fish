#!/usr/bin/env fish

if ! command -qs hyper
	exit 0
end

switch (uname)
case Darwin
	set HYPER_HOME "$HOME/Library/Application Support/Hyper"
case '*'
	set HYPER_HOME "$HOME/.config/Hyper"
end

mkdir -p $HYPER_HOME
	and ln -sf "$DOTFILES/hyper/.hyper.js" "$HYPER_HOME/.hyper.js"