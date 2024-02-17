local onedark = {
  -- Theme inspired by Atom
  'navarasu/onedark.nvim',
  priority = 1000,
  lazy = false,
  config = function()
    require('onedark').setup {
      -- Set a style preset. 'dark' is default.
      style = 'dark', -- dark, darker, cool, deep, warm, warmer, light
    }
    require('onedark').load()
  end,
}

local catppuccin = {
  "catppuccin/nvim",
  lazy = false,
  name = "catppuccin",
  priority = 1000,
  config = function()
    vim.cmd.colorscheme "catppuccin"
  end
}

return onedark
-- return catppuccin

