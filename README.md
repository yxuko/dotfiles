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
## Contributing

Feel free to contribute. Pull requests will be automatically
checked/linted with.

## Thanks

Inspired from [caarlos0's dotfiles](https://github.com/caarlos0/dotfiles.fish) to whom I thank for sharing his dotfiles.
