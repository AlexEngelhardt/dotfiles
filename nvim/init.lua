-- Load a nice default config (kickstart.nvim for now)
-- I stole it from here: https://github.com/nvim-lua/kickstart.nvim/
-- This video explains the best features (it's a bit old, e.g. uses packer instead of lazy.nvim tho): https://www.youtube.com/watch?v=stqUbv-5u2s
-- (I edited that file in a few places though)
-- require('kickstart-nvim')

-- The following video was recommended to show you how to split up e.g.
-- kickstart-nvim into multiple files, one per plugin:
-- https://www.youtube.com/watch?v=6mxWayq-s9I
-- It also shows how to lazy-load plugins only when some event happens.
-- Might be useful later when vim startup time becomes long

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


-- Check if the lazy path exists on your filesystem, and if not,
-- Install `lazy.nvim` plugin manager.
-- See https://github.com/folke/lazy.nvim and
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
require('lazy').setup({
  -- The first table argument to `setup` is the list of plugins to load
  {import = "plugins"},
  -- Subdirectories of "plugins" will not automatically be loaded.
  -- You have to import them separately:
  {import = "plugins.lsp"},
}, {
  -- The second table argument holds lazy.nvim options
  install = {
    colorscheme = { "nightfly" },
  },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false
  }
})

-- My custom overwrites
require('options')
require('keybinds')

-- The line beneath this is called `modeline`.
-- It sets the tab width to equal 2 spaces
-- See `:help modeline` and `:help option-list`
-- vim: ts=2 sts=2 sw=2 et
