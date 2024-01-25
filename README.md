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

## TODO emacs startup faster

- [ ] Migrate to `use-package`:
  - https://www.reddit.com/r/emacs/comments/jjwtvp/migrating_to_usepackage/
  - https://www.gnu.org/software/emacs/manual/html_node/use-package/index.html
- [ ] Install `esup` the emacs startup profiler
  - or [benchmark-init](https://github.com/dholm/benchmark-init-el), or [profile-dotemacs](https://www.emacswiki.org/emacs/ProfileDotEmacs)
- [ ] Look at `C-h v load-path` and 
- [ ] https://www.emacswiki.org/emacs/LoadPath
- [ ] https://www.gnu.org/software/emacs/manual/html_node/emacs/Init-File.html
- [ ] Or start from scratch with doom emacs?
- [ ] Install treemacs though!

## Emacs TODOs

- [ ] dotemacs from scratch, start here, it has git-gutter etc. (but use use-package instead): https://www.reddit.com/r/emacs/comments/18toziz/introducing_lemacs_a_config_not_a_distro/
- [ ] Emacs orgmode on android: https://www.reddit.com/r/emacs/comments/18tqpfb/sharing_my_emacs_workflow_and_dotfiles
- [ ] Learn some elisp:
  - https://www.gnu.org/software/emacs/manual/ , but especially:
  - https://www.gnu.org/software/emacs/manual/eintr.html
  - https://www.gnu.org/software/emacs/manual/elisp.html
- Emacs streamers: https://www.reddit.com/r/emacs/comments/18u9pah/comment/kfj6f8f/

## Misc TODOs

- [X] Make copy+paste behave the same in terminals and vim
  - mouse-highlight and middle-click?
  - Ctrl-Shift-C and V?
  - See `:h clipboard` in nvim
- [ ] Make copy+paste work in tmux too (this is the last one missing...) https://youtu.be/DzNmUNvnB04?t=691
- [ ] Map CapsLock to Ctrl system-wide

### nvim TODOs

- [ ] which-key (make sure which-key is about completions, e.g. "italic" in
markdown mode, not about showing keybinds) should not complete on 'Enter'. Only
on shift-Enter 
- [ ] Find out what the LSP is and does
- [ ] Vim has orgmode! https://github.com/nvim-orgmode/orgmode
- [ ] Try NvChad. Is it a plugin or a straight config file? Does it conflict
with nvim.kickstart?
- [ ] Install NvimTree plugin for nice file browsing. The plugins are called
`nvim-tree/nvim-tree.lua` (and possibly `nvim-tree/nvim-web-devicons` too?)
  - https://github.com/nvim-tree/nvim-tree.lua
- [ ] More plugins to consider:
https://github.com/rockerBOO/awesome-neovim#file-explorer
- [ ] Learn to use the lazy.nvim package manager.
  - https://github.com/folke/lazy.nvim
- [-] Use the vim-style pane switching by installing
christoomey/vim-tmux-navigator in nvim too. I don't yet know how to install
plugins in nvim
  - [X] Custom, additional nvim files
  - [-] vim-tmux-navigator in tmux *and* vim:
- [ ] Play with the leader key (Space) to see what it offers e.g. in Python
files
- [ ] Remove `kickstart-nvim.lua` and build your config from scratch 
  - This playlist might help:
  https://www.youtube.com/playlist?list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ

## Setup

- Install kitty as a terminal emulator. terminator couldn't show all UTF-8 symbols, which is bad for the new-style status bars etc.  alacritty is even more popular, but Lubuntu 18.10 couldn't install it easily.
- Install `ripgrep` too. Some neovim plugin needs it iirc (and learning to use it will be good anyway!)
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
- Install `xss-lock`
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
