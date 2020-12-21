#!/usr/bin/env fish
if test -e ~/.ssh/config
	mv ~/.ssh/config ~/.ssh/config.local
	and ln -s "$DOTFILES"/ssh/config ~/.ssh/config
end

test -f ~/.ssh/config.local || touch ~/.ssh/config.local