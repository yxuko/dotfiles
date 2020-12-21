#!/usr/bin/env fish

if !command -qs code
	exit 0
end

switch (uname)
case Darwin
	set VSCODE_HOME "$HOME/Library/Application Support/Code"
case '*'
	set VSCODE_HOME "$HOME/.config/Code"
end

mkdir -p "$VSCODE_HOME/User"
	and ln -sf "$DOTFILES/vscode/settings.json" "$VSCODE_HOME/User/settings.json"
	and ln -sf "$DOTFILES/vscode/keybindings.json" "$VSCODE_HOME/User/keybindings.json"
	and ln -sf "$DOTFILES/vscode/snippets" "$VSCODE_HOME/User/snippets"

# from `code --list-extensions`
cat $DOTFILES/vscode/extensions.txt | while read module
	code --install-extension "$module"
		and echo "vscode: $module"
		or echo "vscode: failed to install $module"
end