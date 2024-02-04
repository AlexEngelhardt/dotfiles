-- Custom keybinds: Type `:help map-which-keys` for suggestions on what keys to
-- use for custom keybinds.

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

