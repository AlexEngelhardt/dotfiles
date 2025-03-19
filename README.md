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

## Setup

- Install kitty as a terminal emulator. terminator couldn't show all UTF-8 symbols, which is bad for the new-style status bars etc.  alacritty is even more popular, but Lubuntu 18.10 couldn't install it easily.
- Install `ripgrep` too. Some neovim plugin needs it iirc (and learning to use it will be good anyway!)
- Install `fzf`, neovim's plugins might need it and it's fun to use anyway!
- Install `fd` for neovim's Telescope
  - On Ubuntu, the package is `fd-find` and the executable is `fdfind` instead of `fd`. Create an alias for it in `.zshrc`!
- Install neovim **from source** (My Ubuntu 18.10's nvim doesn't allow kickstart.nvim). It's time to ditch emacs :)
- Switch from bash to zsh
  - And a ton of plugins: https://github.com/unixorn/awesome-zsh-plugins
    - most importantly, oh-my-zsh
    - git, taskwarrior, tmux, python look promising
- Try [ripgrep](https://www.dewanahmed.com/ripgrep/) instead of grep, fd instead of find, and look here for more ideas:  https://github.com/ibraheemdev/modern-unix

### Kitty

- Install kitty from apt (if available?) or source
- Install (I used MesloLGS NF) Nerd Font files from here:
  https://github.com/romkatv/powerlevel10k#fonts
  - sudo mv them into `usr/share/fonts/truetype/` and run `sudo fc-cache -f -v`
- Symlink `~/.config/kitty/kitty.conf` to the file here

### Tmux

- Follow https://www.youtube.com/watch?v=H70lULWJeig
  - Install the tpm from github: `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
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

The init.lua in this repo is adapted from https://github.com/nvim-lua/kickstart.nvim/tree/master

- Symlink the whole folder `~/.config/nvim` to the folder here
- Install `xsel` (or `xclip`, but `xsel` is better in tmux
([Source](https://askubuntu.com/questions/705620/xclip-vs-xsel))) so that both
clipboards, `primary` (highlight + middleclick) and `clipboard` (ctrl(+shift)+c
and ctrl(+shift)+v) work in vim too.

### Emacs

- Symlink `~/.emacs` to the `dot-emacs.el` file here
- It just loads everything in the `emacs` folder, which by default is in `$HOME/github/dotfiles/emacs`.

### Git

- Symlink `~/.gitconfig` to the file here

### If Xubuntu and xfce

If you're on Xubuntu, most shortcuts, default apps etc. are configured via menu clicking.

### If Lubuntu and LXDE

If you're on Lubuntu:

- Symlink `~/.config/openbox/lubuntu-rc.xml` to here

### If i3

- Install `rofi` to replace `dmenu` as a program starter
- Install `nitrogen` as a wallpaper manager
- Install `xss-lock`, a screensaver manager
- Install `udisks2` and `udiskie` to automount USB drives
- Symlink `~/.config/i3/config` to `i3-config` here
- (in vim, use the symlink path to edit this file, else syntax highlighting
doesn't work)
- Copy `i3status.config` to `~/.config/i3status/config`
- Ricing:
  - Install "Yosemite San Francisco" ttf fonts (put them into `~/.fonts`)
  - Change the theme for GTK applications
    - Install `lxappearance` and `arc-theme` via `apt`, then run `lxappearance`
    and select one of the Arc themes. Arc *Darker* is still a light theme, with Arc *Dark* your Firefox also switches websites to dark theme.
  - Change the `rofi` theme
    - `git clone https://github.com/lr-tech/rofi-themes-collection.git`
    - Select one. I used spotlight-dark
    - Copy it into `~/.local/share/rofi/themes/`
    - Run `rofi-theme-selector` and select it, confirm with Alt+a
  - Install `picom` the compositor that handles transparency and fading
    - link the config file here to `~/.config/picom/picom.conf`

#### Save and load a predefined workspace layout (e.g. an IDE workspace)

- Create a keybind to a custom zsh script. The script could contain something like this:

```
i3-msg workspace number "3:dev"
i3-msg split vertical
i3-msg exec "kitty -T vim -d ~/code/src"
sleep 1
i3-msg exec "kitty -T 'git / poetry' -d ~/code"
sleep 1
i3-msg resize set height 20 ppt
i3-msg focus parent
i3-msg split horizontal
i3-msg "exec --no-startup-id vlc"
sleep 1
i3-msg split vertical
i3-msg "exec --no-startup-id thunar ~/videos/"
sleep 1
i3-msg resize set height 40 ppt
```

- We need the "sleep 1" commands because i3-msg doesn't wait for windows to open.
This should mean that we only need sleep commands after any exec command.
See https://github.com/i3/i3/issues/854

- And we need --no-startup-id to prevent a 60-second long clock cursor to appear
(see the i3 docs)

# Japanese Input

- This guide worked for me (after some rebooting and retrying the same thing):
  - https://help.ubuntu.com/community/JapaneseInput
  - Set it up in the default Ubuntu environment, not in i3. Then the taskbar applet to switch should appear in i3 too.
- After this, typing kanji worked in GUI applications, but **not in terminal emulators**
  - Workaround: Use emacs-gui instead of terminal emacs, and use `neovide` instead of terminal vim
    - To fix a too-big font size in neovide, start it by setting an env variable before: `WINIT_X11_SCALE_FACTOR=1 neovide`
