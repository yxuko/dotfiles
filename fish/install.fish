#!/usr/bin/env fish

# shortcut to this dotfiles path
set -Ux DOTFILES ~/.dotfiles

# project folder that we can `c [tab]` to
set -Ux PROJECTS ~/Workspace

# default editor
set -Ux EDITOR vim
set -Ux VISUAL $EDITOR
set -Ux VEDITOR code

set -Ua fish_user_paths $DOTFILES/bin $HOME/.bin

# starship prompt
# https://github.com/starship/starship#fish
starship init fish | source

# load up functions
for f in $DOTFILES/*/functions
	set -Up fish_function_path $f
end