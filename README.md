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

## Setup TODOs

- Choose a terminal emulator. alacritty seems popular. Or kitty?
- Finally switch from emacs to vim? :-(
- Switch from bash to zsh
  - And a ton of plugins: https://github.com/unixorn/awesome-zsh-plugins
    - most importantly, oh-my-zsh
    - git, taskwarrior, tmux, python look promising
- Try [ripgrep](https://www.dewanahmed.com/ripgrep/) instead of grep, fd instead of find, and look here for more ideas:  https://github.com/ibraheemdev/modern-unix

## Setup

### Emacs

- Symlink `~/.emacs` to the `dot-emacs.el` file here
- It just loads everything in the `emacs` folder, which by default is in `$HOME/github/dotfiles/emacs`.

### Bash and bash-it

- Symlink `~/.bashrc` to the file here
- Install `bash-it` from github
  - Run one of these to get started:

```
bash-it aliases
bash-it completions
bash-it plugins
```

### Git

- Symlink `~/.gitconfig` to the file here

### Tmux

- Symlink `~/.tmux.conf` to the file here
- Symlink `~/.bash_profile` to the file here, so that tmux loads your `.bashrc` too

### lubuntu-rc.xml

- Symlink `~/.config/openbox/lubuntu-rc.xml` to here
