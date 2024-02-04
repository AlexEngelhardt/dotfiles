-- Load a nice default config (kickstart.nvim for now)
-- I stole it from here: https://github.com/nvim-lua/kickstart.nvim/
-- This video explains the best features (it's a bit old, e.g. uses packer instead of lazy.nvim tho): https://www.youtube.com/watch?v=stqUbv-5u2s
-- (I edited that file in a few places though)
-- require('kickstart-nvim')


-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- My custom overwrites
require('plugins')
require('options')
require('keybinds')

-- You can load a vimscript file too
-- (for stuff I haven't found out how to translate into Lua yet)
local vimrc = vim.fn.stdpath("config") .. "/vimscript.vim"
vim.cmd.source(vimrc)
