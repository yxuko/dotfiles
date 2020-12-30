#!/usr/bin/env fish

# Don't ask ssh password all the time
switch (uname)
case Darwin
	git config --global credential.helper osxkeychain
case '*'
	git config --global credential.helper cache
end

# better diffs
if command -qs delta
	git config --global core.pager delta
	git config --global interactive.diffFilter 'delta --color-only'
	git config --global delta.syntax-theme GitHub
	git config --global delta.line-numbers true
	git config --global delta.decorations true
end

# use vscode as mergetool
if command -qs code
	git config --global merge.tool vscode
		and git config --global mergetool.vscode.cmd "code --wait $MERGED"
end


abbr -a g 'git'
abbr -a ga 'git add'
abbr -a gaa 'git add -A'
abbr -a gap 'git add --patch'
abbr -a gb 'git branch -v'
abbr -a gba 'git branch --all'
abbr -a gbm 'git branch -m'
abbr -a gbr 'git branch --remote'
abbr -a gca 'git commit -s -a'
abbr -a gcm 'git commit -s -m'
abbr -a gcam 'git commit -s -a -m'
abbr -a gcl 'git clone'
abbr -a gco 'git checkout'
abbr -a gcom 'git checkout master'
abbr -a gdc 'git diff --cached'
abbr -a gdf 'git diff'
abbr -a gf 'git fetch'
abbr -a gfu 'git fetch upstream'
abbr -a gm 'git merge'
abbr -a gpl 'git pull'
abbr -a gplp 'git pull --prune'
abbr -a gps 'git push'
abbr -a gpsf 'git push --force-with-lease'
abbr -a gpst 'git push --tags'
abbr -a gpub 'git publish'
abbr -a gpum 'git push -u origin master'
abbr -a gpuo 'git push -u origin'
abbr -a gra 'git remote add'
abbr -a grb 'git rebase'
abbr -a grba 'git rebase --abort'
abbr -a grbc 'git rebase --continue'
abbr -a grbi 'git rebase -i'
abbr -a grbm 'git rebase master'
abbr -a gre 'git reset'
abbr -a grso 'git remote set-url origin'
abbr -a grsu 'git remote set-url'
abbr -a grup 'git remote add upstream'
abbr -a grv 'git remote -v'
abbr -a gs 'git status -sb'
abbr -a gtl 'git tag --list'