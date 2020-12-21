#!/usr/bin/env fish

cat $DOTFILES/fisher/plugins | while read module
	fisher install "$module"
		and echo "vscode: $module"
		or echo "vscode: failed to install $module"
end