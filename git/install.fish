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
abbr -a gl 'git pull --prune'
abbr -a glg 'git log --graph --decorate --oneline --abbrev-commit'
abbr -a glga 'glg --all'
abbr -a gp 'git push origin HEAD'
abbr -a gpa 'git push origin --all'
abbr -a gd 'git diff'
abbr -a gc 'git clone'
abbr -a gcm 'git commit -s'
abbr -a gca 'git commit -s -a'
abbr -a gco 'git checkout'
abbr -a gb 'git branch -v'
abbr -a ga 'git add'
abbr -a gaa 'git add -A'
abbr -a gcm 'git commit -s -m'
abbr -a gcam 'git commit -s -a -m'
abbr -a gs 'git status -sb'
abbr -a gpr 'gp && git pr'
abbr -a glnext 'git log --oneline $(git describe --tags --abbrev=0 @^)..@'