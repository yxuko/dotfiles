#!/bin/sh
# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`

if which gls >/dev/null 2>&1; then
  alias ls="gls -F --color"
  alias l="gls -lAh --color"
  alias ll="gls -l --color"
  alias la="gls -A --color"
else
  alias ls="ls -Fh --color"
  alias l="ls -lAh --color"
  alias ll="ls -l --color"
  alias la="ls -A --color"
fi

alias grep="grep --color=auto"
alias duf="du -sh * | sort -hr"
alias less="less -r"
alias lsopenports='lsof -i -n -P'

if [ "$(uname -s)" != "Darwin" ]; then
  if [ -z "$(command -v pbcopy)" ]; then
    if [ -n "$(command -v xclip)" ]; then
      alias pbcopy="xclip -selection clipboard"
      alias pbpaste="xclip -selection clipboard -o"
    elif [ -n "$(command -v xsel)" ]; then
      alias pbcopy="xsel --clipboard --input"
      alias pbpaste="xsel --clipboard --output"
    fi
  fi
  if [ -e /usr/bin/xdg-open ]; then
    alias open="xdg-open"
  fi
fi

# greps non ascii chars
nonascii() {
  LANG=C grep --color=always '[^ -~]\+';
}
