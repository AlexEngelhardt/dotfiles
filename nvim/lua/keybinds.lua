----------------------------------------------------------------
-- Custom keybinds: Type `:help map-which-keys` for suggestions on what keys to
-- use for custom keybinds.

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


-- Make F3 open a file explorer
-- (:Explore, :Texplore are defaults, :Neotree or :Nvimtree modern alternatives)
-- In Neotree, press `?` to see a popup with commands. `q` closes a Neotree sidebar
vim.api.nvim_set_keymap('n', '<F3>', ':Neotree toggle<CR>', { noremap = true, silent = true, desc = "File Explorer on/off" })
vim.api.nvim_set_keymap('i', '<F3>', '<Esc>:Neotree toggle<CR>', { noremap = true, silent = true, desc = "File Explorer on/off" })

-- Quicker writing and quitting because German keyboard ':' hurts my pinky
vim.api.nvim_set_keymap('n', '<leader>w', ":w<CR>", { noremap = true, desc = "[W]rite buffer" })
vim.api.nvim_set_keymap('n', '<leader>q', ":q<CR>", { noremap = true, desc = "[Q]uit" })

----------------------------------------------------------------
-- Leader-ö becomes my submenu of keybinds

require("which-key").add({
  { "<leader>ö", group = "+Alex keybinds" }
})

-- "format around paragraph"
-- Note: To correctly format markdown lists, I had to overwrite kickstart.nvim's
--   treesitter config to disable formatting of markdown code - it overwrote the default
--   formatter. Also see `:help formatoptions` and `:help fo-table`, you might have to
--   add some options there
vim.api.nvim_set_keymap('n', '<leader>öd', '<cmd>DiffOrig<cr>', { noremap = true, silent = true, desc = "[D]iff buffer with saved file" })
vim.api.nvim_set_keymap('n', '<leader>öf', 'gqap', { noremap = true, silent = true, desc = "[F]ormat paragraph" })
vim.api.nvim_set_keymap('n', '<leader>öh', ":nohlsearch<CR>", { noremap = true, desc = "Search [H]ighlight off" })
-- (`=` indents!)
vim.api.nvim_set_keymap('n', '<leader>öi', "gg=G", { noremap = true, desc = "[I]ndent whole buffer" })
vim.api.nvim_set_keymap('n', '<leader>öt', [[:%s/\s\+$//e<CR>]], { noremap = true, desc = "Delete all [T]railing whitespace" })


-- Try defining keybinds within which-key. See:
-- https://github.com/folke/which-key.nvim?tab=readme-ov-file#%EF%B8%8F-mappings

require("which-key").add({
    { "<leader>Ü", group = "grüpname" },
    { "<leader>Üf", "<cmd>Telescope find_files<cr>", desc = "Fünd Füle" },
})
