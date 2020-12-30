# yxuko' dotfiles

[![Powered by Fish][ab]][ap]

> Config files for Fish, Java, Ruby, Go, Editors, Terminals and more.

[ap]: https://github.com/getantibody/antibody
[ab]: https://img.shields.io/badge/powered%20by-fish-blue.svg?style=for-the-badge
## Installation

### Dependencies

First, make sure you have all those things installed:

- `git`: to clone the repo
- `curl`: to download some stuff
- `tar`: to extract downloaded stuff
- `fish`: to actually run the dotfiles
- `sudo`: some configs may need that

### Install

Then, run these steps:

```console
$ git clone https://github.com/yxuko/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
$ ./dotfiles.fish
```

> All changed files will be backed up with a `.backup` suffix.

#### Update

To update, you just need to git pull and run again:

```console
$ cd ~/.dotfiles
$ git pull
$ ./dotfiles.fish
```

### Recommended Software

- [`starship`](https://starship.rs) ☄🌌️ a minimal, blazing-fast, and infinitely customizable prompt for any shell!
- [`bat`](https://github.com/sharkdp/bat) a `cat` with wings
- [`exa`](https://the.exa.website) a modern replacement for `ls`
- [`fd`](https://github.com/sharkdp/fd) a simple, fast and user-friendly alternative to `find`
- [`fzf`](https://github.com/junegunn/fzf) for a fuzzy-finder, used in `,t` on vim, for example
- [`grc`](https://github.com/garabik/grc) to colorize command's outputs

### Themes and Fonts

I am using **[Altair](https://github.com/yxuko/hyper-altair)** for [Hyper](https://hyper.is) and
**[Source Code Pro Light](https://www.jetbrains.com/lp/mono/)** as a font.

## Contributing

Feel free to contribute. Pull requests will be automatically
checked/linted with.

## Thanks

Inspired from [caarlos0's dotfiles](https://github.com/caarlos0/dotfiles.fish) to whom I thank for sharing his dotfiles.
