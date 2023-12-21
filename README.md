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
- https://github.com/bashbunni/dotfiles/

## TODOs

- [X] How to make Ctrl-Alt-t start tmux directly
- [X] How to enable middle click to paste in nvim?
- [ ] Install nicer fonts for zsh's p10k theme: https://github.com/romkatv/powerlevel10k#fonts
- [ ] Use the vim-style pane switching by installing christoomey/vim-tmux-navigator in nvim too. I don't yet know how to install plugins in nvim
- [ ] Customize tmux' dracula theme: https://draculatheme.com/tmux
- [ ] vim leave edit mode with 'jk' instead of Esc
- [ ] Play with i3
- [X] zsh autosuggestions as you type
- [ ] Map CapsLock to Ctrl
- [ ] install ripgrep, and some of these too? https://github.com/ibraheemdev/modern-unix

## Setup

- Install kitty as a terminal emulator. terminator couldn't show all UTF-8 symbols, which is bad for the new-style status bars etc.  alacritty is even more popular, but Lubuntu 18.10 couldn't install it easily.
- Install `ripgrep` too. Some neovim plugin needs it iirc (and learning to use it will be good anyway!)
- Install neovim **from source** (My Ubuntu 18.10's nvim doesn't allow kickstart.nvim). It's time to ditch emacs :)
- Switch from bash to zsh
  - And a ton of plugins: https://github.com/unixorn/awesome-zsh-plugins
    - most importantly, oh-my-zsh
    - git, taskwarrior, tmux, python look promising
- Try [ripgrep](https://www.dewanahmed.com/ripgrep/) instead of grep, fd instead of find, and look here for more ideas:  https://github.com/ibraheemdev/modern-unix

## Setup

### Kitty

- Install kitty from apt (if available?) or source
- Install Nerd Font files from here: https://github.com/romkatv/powerlevel10k#fonts
  - sudo mv them into `usr/share/fonts/truetype/` and run `sudo fc-cache -f -v`
- Symlink `~/.config/kitty/kitty.conf` to the file here

### Tmux

- https://www.youtube.com/watch?v=H70lULWJeig
- https://draculatheme.com/tmux
- Symlink `~/.tmux.conf` to the file here

### zsh and oh-my-zsh

- Install zsh and `chsh`, choose `/usr/bin/zsh`
- Symlink `~/.zshrc` to the file here
- Install `oh-my-zsh` from github
- Install zsh-autosuggestions and zsh-syntax-highlighting:

```
cd $ZSH_CUSTOM/plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
```

- Now make sure zsh-autosuggestions and zsh-syntax-highlighting are in your `.zshrc`'s `plugins` list
- Install the powerlevel10k theme:

```
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
```

- Symlink `~/.p10k.zsh` to the file here (or remove it and a config wizard autostarts the next time you open a zsh)

### Neovim

Install `kickstart.nvim` as described here: https://www.youtube.com/watch?v=stqUbv-5u2s
(the init.lua in this repo is adapted from there)

### Emacs

- Symlink `~/.emacs` to the `dot-emacs.el` file here
- It just loads everything in the `emacs` folder, which by default is in `$HOME/github/dotfiles/emacs`.

### Git

- Symlink `~/.gitconfig` to the file here

### lubuntu-rc.xml

- Symlink `~/.config/openbox/lubuntu-rc.xml` to here
