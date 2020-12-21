#!/usr/bin/env fish

# ------------------------------------------------------------------------------
# | Defaults                                                                   |
# ------------------------------------------------------------------------------

# Enable simple aliases to be sudo'ed. ("sudone"?)
# http://www.gnu.org/software/bash/manual/bashref.html#Aliases says: "If the
# last character of the alias value is a space or tab character, then the next
# command word following the alias is also checked for alias expansion."

# Super user
abbr -a _ 'sudo'
abbr -a please 'sudo'
abbr -a clr 'clear'


# Confirm before overwriting
# --------------------------
# I know it is bad practice to override the default commands, but this is for
# my own safety. If you really want the original "instakill" versions, you can
# use "command rm", "\rm", or "/bin/rm" inside your own commands, aliases, or
# shell functions. Note that separate scripts are not affected by the aliases
# defined here.
#abbr -a cp 'cp -i'
#abbr -a mv 'mv -i'
#abbr -a ln 'ln -i'
abbr -a rm 'rm -I'     # 'rm -i' prompts for every file
abbr -a rmf 'rm -rf'

# safety features
abbr -a chown 'chown --preserve-root'
abbr -a chmod 'chmod --preserve-root'
abbr -a chgrp 'chgrp --preserve-root'

# ------------------------------------------------------------------------------
# | Global Quick Commands                                                      |
# ------------------------------------------------------------------------------

# quick & short
abbr -a j 'jobs'

# ------------------------------------------------------------------------------
# | Navigation                                                                 |
# ------------------------------------------------------------------------------

# Easier navigation: .., ..., ...., ....., ~ and -
abbr -a .. 'cd ..'
abbr -a ... 'cd ../..'
abbr -a .... 'cd ../../..'
abbr -a ..... 'cd ../../../..'
abbr -a ~ 'cd ~'       # `cd` is probably faster to type though
abbr -a -- - 'cd -'

# fallback by typo
abbr -a cd.. 'cd ..'
abbr -a cd... 'cd ../..'
abbr -a cd.... 'cd ../../..'
abbr -a cd..... 'cd ../../../..'