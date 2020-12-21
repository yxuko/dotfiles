#!/usr/bin/env fish
#
# Run all dotfiles installers.

set DOTFILES_ROOT (pwd -P)

function info
	echo [(set_color --bold blue) ' ⇒ ' (set_color normal)] $argv
end

function bot
	echo [(set_color --bold cyan)\[ ._. ]/(set_color normal)] $argv
end

function success
	echo (set_color --bold green)[ ' OK ' ](set_color normal) $argv
end

function warning
	echo (set_color --bold yellow)[ ' WARNING ' ](set_color normal) $argv
end

function fail
	echo (set_color --bold red)[ 'FAILED' ](set_color normal)] $argv
    exit 1
end

function setup_gitconfig
    action 'Setup Git Credential'
	set managed (git config --global --get dotfiles.managed)
	# if there is no user.email, we'll assume it's a new machine/setup and ask it
	if test -z (git config --global --get user.email)
		bot 'What is your Git author name ?'
		read user_name
		bot 'What is your Git author email ?'
		read user_email

		test -n $user_name
			or echo 'Please inform the Git author name'
		test -n $user_email
			or abort 'Please inform the Git author email'

		git config --global user.name $user_name
			and git config --global user.email $user_email
			or fail 'Failed to setup Git Credential'
	else if test '$managed' = "true"
		# if user.email exists, let's check for dotfiles.managed config. If it is
		# not true, we'll backup the gitconfig file and set previous user.email and
		# user.name in the new one
		set user_name (git config --global --get user.name)
			and set user_email (git config --global --get user.email)
			and mv ~/.gitconfig ~/.gitconfig.backup
			and git config --global user.name $user_name
			and git config --global user.email $user_email
			and success 'Moved ~/.gitconfig to ~/.gitconfig.backup'
			or fail 'Failed to setup Git Credential'
	else
		# otherwise this gitconfig was already made by the dotfiles
		info 'Your Git already managed by dotfiles'
	end
	# include the gitconfig.local file
	# finally make git knows this is a managed config already, preventing later
	# overrides by this script
	git config --global include.path ~/.gitconfig.local
		and git config --global dotfiles.managed true
		or fail 'Failed to setup Git Credential'
end

function link_file -d "links a file keeping a backup"
	echo $argv | read -l old new backup
	if test -e $new
		set newf (readlink $new)
		if test "$newf" = "$old"
			warning "Skipped $old"
			return
		else
        	bot "File already exists: $new ($(basename "$old")), What do you want to do?\n
            [s]kip, [o]verwrite, [b]ackup?"
		    read choice

            switch ($choice)
            case o
                set overwrite true
            case b
                set backup true
            case s
				set skip true
            case '*'
                fail 'I told you to choose from [s]kip, [o]verwrite, [b]ackup !'
            end

            if test $overwrite = "true"
                rm -rf "$new"
                warning "Removed $new"
                mkdir -p (dirname $new)
                    and ln -sf $old $new
                    and success "Linked $old to $new"
                    or fail "Could not link $old to $new"
            end

            if test $backup = "true"
                mv $new $new.$backup
                    and success "Moved $new to $new.$backup"
                    or fail "failed to backup $new to $new.$backup"
                mkdir -p (dirname $new)
                    and ln -sf $old $new
                    and success "Linked $old to $new"
                    or fail "Could not link $old to $new"
            end

            if test $skip = "true"
                warning "Skipped $new"
            end
		end
	end
end

function install_dotfiles
	action 'Linking dotfiles'
	for src in $DOTFILES_ROOT/*/*.symlink
		link_file $src $HOME/.(basename $src .symlink) backup
			or fail 'Failed to link config file'
	end

	link_file $DOTFILES_ROOT/bat/config $HOME/.config/bat/config backup
		or abort bat
	link_file $DOTFILES_ROOT/htop/htoprc $HOME/.config/htop/htoprc backup
		or abort htoprc
	link_file $DOTFILES_ROOT/ssh/config $HOME/.ssh/config local
		or abort ssh
end

function setup_fish
	action "Setting Fish as Default Shell"
	if !test (which fish) = $SHELL
        chsh -s (which fish)
            and success set (fish --version) as the default shell
            or abort 'set fish as default shell'
    end
end

curl -sL git.io/fisher | source && fisher install jorgebucaran/fisher
	and success 'Fisher has been installed'
	or fail 'Fisher coudn\'t be installed!'

setup_gitconfig
	and success 'Git Credential has been configured !'
	or fail 'Git Credential Config Failed!'

install_dotfiles
	and success 'dotfiles'
	or fail 'dotfiles'

mkdir -p ~/.config/fish/completions/
	and success 'completions'
	or fail 'completions'

for installer in */install.fish
	$installer
		and success $installer
		or fail $installer
end

for installer in */install.fish
	$installer
		and success $installer
		or fail $installer
end

if ! grep (command -v fish) /etc/shells
	command -v fish | sudo tee -a /etc/shells
		and success 'Added fish to /etc/shells'
		or fail 'Setup /etc/shells'
	echo
end

setup_fish
	and success "$fish $("$fish" --version) has been set as default shell"
	or fail 'Coudn\'t set Fish as default shell'

success 'All done! Dotfiles installed/updated!'