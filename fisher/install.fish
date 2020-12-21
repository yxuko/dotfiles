#!/usr/bin/env fish

if !command -qs code
	exit 0
end

cat $DOTFILES/fisher/plugins | while read module
	fisher install "$module"
		and echo "vscode: $module"
		or echo "vscode: failed to install $module"
end