----------------------------------------------------------------
-- Debugging keybinds

-- Run `:verbose map <space>` to see which file and setting last
-- modified the mapping of Space in normal mode.
-- Use `:verbose vmap <space>` for verbose mode, etc.

----------------------------------------------------------------
-- Remap existing keybinds

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`

-- In normal and visual mode, make the Space key do nothing (except be your new leader key):
-- (This setting seems to be necessary in Windows)
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Make j and k in long, wrapped lines walk one visible line instead of one file line
-- (what `gk` and `gj` do by default)
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })


----------------------------------------------------------------
-- Custom keybinds: Type `:help map-which-keys` for suggestions on what keys to
-- use for custom keybinds.

-- Make F3 open a file explorer
-- (:Explore, :Texplore are defaults, :Neotree or :Nvimtree modern alternatives)
vim.api.nvim_set_keymap('n', '<F3>', ':Neotree<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<F3>', '<Esc>:Neotree<CR>', { noremap = true, silent = true })
-- In Neotree, press `?` to see a popup with commands. `q` closes a Neotree sidebar

-- Make F4 "format around paragraph"
-- Note: To correctly format markdown lists, I had to overwrite kickstart.nvim's
--   treesitter config to disable formatting of markdown code - it overwrote the default
--   formatter. Also see `:help formatoptions` and `:help fo-table`, you might have to
--   add some options there
vim.api.nvim_set_keymap('n', '<F4>', 'gqap', { noremap = true, silent = true })

-- Make F5 delete trailing whitespaces
vim.api.nvim_set_keymap('n', '<F5>', [[:%s/\s\+$//e<CR>]], { noremap = true })

