#!/bin/sh
install() {
	curl -L -s -o "$1/JetBrainsMono-1.0.4.zip" \
		https://github.com/JetBrains/JetBrainsMono/releases/download/v1.0.4/JetBrainsMono-1.0.4.zip
        unzip JetBrainsMono-1.0.4.zip -d $1
        fc-cache -f -v
}

if [ "$(uname -s)" = "Darwin" ]; then
	if command -v brew >/dev/null 2>&1; then
		brew tap homebrew/cask-fonts
		brew cask install font-jetbrains-mono
	else
		install ~/Library/Fonts
	fi
else
	mkdir -p ~/.fonts
	install ~/.fonts
fi