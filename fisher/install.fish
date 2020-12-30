#!/usr/bin/env fish

cat $DOTFILES/fisher/plugins | while read module
	fisher install "$module"
		and echo "fisher: $module"
		or echo "fisher: failed to install $module"
end