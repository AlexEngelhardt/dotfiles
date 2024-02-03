-- Hi :)

-- Use 'fj' instead of <Esc> to switch from insert to visual:
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true, silent = true})

-- Highlight search results while typing
vim.o.hlsearch = true

-- Show relative line numbers in gutter
vim.o.relativenumber = true

-- Neovide settings
if vim.g.neovide then
  vim.o.guifont = "MesloLGS NF:h11"
end

-- Make F3 open a file explorer
-- (:Explore for now. Try nvimtree or neotree too)
vim.api.nvim_set_keymap('n', '<F3>', ':Texplore<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<F3>', '<Esc>:Texplore<CR>', { noremap = true, silent = true })

-- Make F4 "format around paragraph"
-- Note: To correctly format markdown lists, I had to overwrite kickstart.nvim's
--   treesitter config to disable formatting of markdown code - it overwrote the default
--   formatter. Also see `:help formatoptions` and `:help fo-table`, you might have to
--   add some options there
vim.api.nvim_set_keymap('n', '<F4>', 'gqap', { noremap = true, silent = true })

-- Make F5 delete trailing whitespaces
vim.api.nvim_set_keymap('n', '<F5>', [[:%s/\s\+$//e<CR>]], { noremap = true })

