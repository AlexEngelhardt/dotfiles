-- Load a nice default config (kickstart.nvim for now)
-- I stole it from here: https://github.com/nvim-lua/kickstart.nvim/
-- This video explains the best features (it's a bit old, e.g. uses packer instead of lazy.nvim tho): https://www.youtube.com/watch?v=stqUbv-5u2s
-- (I edited that file in a few places though)
-- require('kickstart-nvim')

-- The following video was recommended to show you how to split up e.g.
-- kickstart-nvim into multiple files, one per plugin:
-- https://www.youtube.com/watch?v=6mxWayq-s9I

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


-- [[ Install `lazy.nvim` plugin manager ]]
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- [[ Configure plugins ]]
-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require('lazy').setup("plugins")
-- <Alex> I moved the plugins from kickstart.nvim into
-- one file per plugin by following this video:
-- https://www.youtube.com/watch?v=6mxWayq-s9I

-- My custom overwrites
require('options')
require('keybinds')

-- You can load a vimscript file too
-- (for stuff I haven't found out how to translate into Lua yet)
local vimrc = vim.fn.stdpath("config") .. "/vimscript.vim"
vim.cmd.source(vimrc)

-- The line beneath this is called `modeline`.
-- See `:help modeline` and `:help option-list`
-- vim: ts=2 sts=2 sw=2 et
