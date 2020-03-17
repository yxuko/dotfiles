#!/bin/sh
alias reload!='exec "$SHELL" -l'

# User Aliases.
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi