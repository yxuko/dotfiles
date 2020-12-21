#!/usr/bin/env fish



if !command -qs nvim
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	vim +'PlugUpdate | PlugInstall --sync' +qa
else
	abbr -a vim 'nvim'
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

	mkdir -p ~/.config/nvim/
		and ln -sf "$DOTFILES/vim/vimrc.symlink" ~/.config/nvim/init.vim
		and vim +'PlugUpdate | PlugInstall --sync' +qa
end