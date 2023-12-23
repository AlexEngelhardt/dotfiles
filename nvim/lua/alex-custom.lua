-- Hi :)

-- Use 'jk' instead of <Esc> to switch from insert to visual:
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true, silent = true})

-- Highlight search results while typing
vim.o.hlsearch = true

-- Show relative line numbers in gutter
vim.o.relativenumber = true
