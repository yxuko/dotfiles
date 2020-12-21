#!/usr/bin/env fish

function install
	curl -Lso "$1/JetBrainsMono-2.210.zip" https://github.com/JetBrains/JetBrainsMono/releases/download/v2.210/JetBrainsMono-2.210.zip
        and unzip JetBrainsMono-2.210.zip -d $1
end

switch (uname)
case Darwin
	if command -qs brew
		brew tap -q homebrew/cask-fonts
			and brew cask install font-jetbrains-mono
	else
		install ~/Library/Fonts
	end
case '*'
	mkdir -p ~/.fonts/
		and install ~/.fonts/
	if command -qs fc-cache
		fc-cache -fv
	end
end