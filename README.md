# dotfiles

Config files.

Initiated by rereading chapter 3 of The Pragmatic Programmer.

## Why?

- https://dotfiles.github.io/
- https://github.com/webpro/awesome-dotfiles/tree/master

## Inspiration

- OMG the guy and his videos here: https://github.com/craftzdog/dotfiles-public
  - Oh the speed! https://www.youtube.com/watch?v=sSOfr2MtRU8
  - And this: https://www.youtube.com/watch?v=KKxhf50FIPI
- https://dotfiles.github.io/inspiration/

## TODOs

- [X] How to make Ctrl-Alt-t start tmux directly
- [X] How to enable middle click to paste in nvim?

## Setup

- Install kitty as a terminal emulator. terminator couldn't show all UTF-8 symbols, which is bad for the new-style status bars etc.  alacritty is even more popular, but Lubuntu 18.10 couldn't install it easily.
- Install neovim **from source** (My Ubuntu 18.10's nvim doesn't allow kickstart.nvim). It's time to ditch emacs :)
- Switch from bash to zsh
  - And a ton of plugins: https://github.com/unixorn/awesome-zsh-plugins
    - most importantly, oh-my-zsh
    - git, taskwarrior, tmux, python look promising
- Try [ripgrep](https://www.dewanahmed.com/ripgrep/) instead of grep, fd instead of find, and look here for more ideas:  https://github.com/ibraheemdev/modern-unix

## Setup

### Tmux

https://www.youtube.com/watch?v=H70lULWJeig

### Neovim

Install `kickstart.nvim` as described here:
https://www.youtube.com/watch?v=stqUbv-5u2s
(the init.lua in this repo is adapted from there)

### Emacs

- Symlink `~/.emacs` to the `dot-emacs.el` file here
- It just loads everything in the `emacs` folder, which by default is in `$HOME/github/dotfiles/emacs`.

### zsh and oh-my-zsh

- Symlink `~/.zshrc` to the file here
- Install `oh-my-zsh` from github

### Git

- Symlink `~/.gitconfig` to the file here

### Tmux

- Symlink `~/.tmux.conf` to the file here
- Symlink `~/.bash_profile` to the file here, so that tmux loads your `.bashrc` too

### lubuntu-rc.xml

- Symlink `~/.config/openbox/lubuntu-rc.xml` to here
