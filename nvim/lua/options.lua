-- Use 'fj' instead of <Esc> to switch from insert to visual:
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true, silent = true})

-- Highlight search results while typing
vim.o.hlsearch = true

-- Make line numbers default
vim.wo.number = true
-- Show relative line numbers in gutter
vim.o.relativenumber = true

-- Neovide settings
if vim.g.neovide then
  vim.o.guifont = "MesloLGS NF:h11"
end

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default (for e.g. git-gutter or debugger)
vim.wo.signcolumn = 'yes'

-- Decrease update time for keycombos (e.g. `jk` to leave insert mode)
vim.o.updatetime = 250
vim.o.timeoutlen = 300


-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})


----------------------------------------------------------------
-- Autocommands

-- see: https://www.youtube.com/watch?v=HR1dKKrOmDs&t=29s
-- For the possible events (like FileType), see `:help events`
-- For FileType events, `pattern` is the *type* (as shown in the
-- lualine), not the filename (so "*.lua" won't work)
-- Type `:echo &ft` in a buffer to see its file type


-- Set tabs to 2 spaces in .lua files
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"lua", "text", "markdown"},
  callback = function()
    -- print("event fired: Entered a lua buffer")  -- <- debug line :)
    vim.opt_local.expandtab = true
    vim.opt_local.shiftwidth = 2
    vim.opt_local.smartindent = true
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
  end,
})
