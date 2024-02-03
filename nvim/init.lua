-- Load a nice default config (kickstart.nvim for now)
-- I stole it from here: https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua
-- This video explains the best features (it's a bit old, e.g. uses packer instead of lazy.nvim tho): https://www.youtube.com/watch?v=stqUbv-5u2s
require('kickstart-nvim')

-- My custom overwrites
require('alex-custom')

-- Load a vimscript file too
local vimrc = vim.fn.stdpath("config") .. "/lua/alex-custom.vim"
vim.cmd.source(vimrc)
