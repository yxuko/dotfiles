#!/bin/sh
if test "$(which code)"; then
	if [ "$(uname -s)" = "Darwin" ]; then
		VSCODE_HOME="$HOME/Library/Application Support/Code"
	else
		VSCODE_HOME="$HOME/.config/Code"
	fi

	# from `code --list-extensions`
	exts="
      ahmadawais.shades-of-purple
      dbaeumer.vscode-eslint
      Equinusocio.vsc-material-theme
      felixfbecker.php-debug
      felixfbecker.php-intellisense
      felixfbecker.php-pack
      lamartire.git-indicators
      ms-python.python
      ms-vscode.sublime-keybindings
      robinbentley.sass-indented
      yxuko.vscode-altair
      wwm.better-align
      esbenp.prettier-vscode
      CoenraadS.bracket-pair-colorizer-2
      formulahendry.auto-close-tag
      formulahendry.auto-rename-tag
  "

	for ext in $exts; do
		code --install-extension "$ext" || true
	done

fi
