-- nvim-lspconfig:
--   - This is not the LSP server! It's just default configs
--   - It *connects* nvim to the LSPs (installed via mason)
--   - Brings sensible defaults for various LSPs
--   - Launches LSP automatically for corresponding filetypes
--   You could do the above yourself without nvim-lspconfig
--   if you wanted.
--
-- mason.nvim:
--   - a LSP plugin manager that actually installs the language servers
--   - lspconfig is then what you use to define what
--     LSP you want and what configurations to enable
--
-- mason-lspconfig.nvim:
--   - Bridges the gap between mason and lspconfig
--   - Adds ensure_installed
--


-- Type `:LspInfo` to see which LSPs are attached to a buffer
-- Type `:help vim.lsp.buf` to see what functions you have to communicate with language servers


return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "pyright",  -- the best python LSP, it seems
          -- regarding "black": Mason can only install LSPs, not formatters, by default.
        }
      })
    end
  },
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              -- otherwise "vim.o.*" shows an error
              globals = { 'vim' }
            },
            runtime = {
              -- Allow unicode variable names (needed for <leader>ö keybinds)
              unicodeName = true
            }
          }
        }
      })
      lspconfig.pyright.setup({})

      -- See https://github.com/neovim/nvim-lspconfig/blob/master/README.md
      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          -- Buffer local mappings
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = ev.buf, desc="LSP: [R]e[n]ame" })
          vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions, { buffer = ev.buf, desc="LSP: [G]oto [D]efinition" })
          vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, { buffer = ev.buf, desc="LSP: [G]oto [R]eferences" })
          vim.keymap.set('n', 'gI', require('telescope.builtin').lsp_implementations, { buffer = ev.buf, desc="LSP: [G]oto [I]mplementation" })
          vim.keymap.set('n', '<leader>D', require('telescope.builtin').lsp_type_definitions, { buffer = ev.buf, desc="LSP: Type [D]efinition" })
          vim.keymap.set('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols, { buffer = ev.buf, desc="LSP: [D]ocument [S]ymbols" })
          vim.keymap.set('n', '<leader>ws', require('telescope.builtin').lsp_workspace_symbols, { buffer = ev.buf, desc="LSP: [W]orkspace [S]ymbols" })

          -- See `:help K` for why this keymap
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = ev.buf, desc="Hover Documentation" })
          vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { buffer = ev.buf, desc="LSP: Signature Documentation" })

          vim.keymap.set('n', '<leader>fb', vim.lsp.buf.format, { buffer = ev.buf, desc="LSP: [F]ormat [B]uffer" })
        end,
      })
    end
  },
}
