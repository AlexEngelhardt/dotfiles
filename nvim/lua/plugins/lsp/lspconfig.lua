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
          -- Add only entries from this list: https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers
          "lua_ls",
          "pyright", -- the best python LSP, it seems
          -- regarding "black": Mason can only install LSPs, not formatters, by default.
        }
      })
    end
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    requires = {
      'williamboman/mason.nvim',
    },
    config = function()
      require('mason-tool-installer').setup({
        ensure_installed = {
          -- 'black',
          -- 'isort',
          'stylua',
          -- 'debugpy',
        },
      })
    end,
  },
  {
    -- Linting and formatting (black, flake8, etc.) aren't language servers, but command line tools.
    -- Back in the day, A.L.E. (asynchronous linting engine) and coc.nvim (conquer of completion) were used
    -- to handle these tools, but they were a bit awkward.
    --
    -- Then null-ls came along! It wraps command line tools in a generalized LSP,
    -- enabling easy communication with the LSP.
    -- You can now call LSP functions to run e.g. 'black'
    --
    -- null-ls is deprecated though. none-ls is a new fork. Note: none-ls still uses "null-ls" variables etc.

    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua, -- You must manually install stylua with :Mason
          -- null_ls.builtins.formatting.black,  -- doesn't work somehow :(
        }
      })

      --  lspconfig.lua already binds <leader>fb to Format Buffer

      -- Keep this binding in as a debug line. If which-key shows it, the plugin is active:
      vim.keymap.set('n', '<leader>fÄ', vim.lsp.buf.format, { desc = "LSP: [F]ormat [Ä]uffer" })
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
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = ev.buf, desc = "LSP: [R]e[n]ame" })
          vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions,
            { buffer = ev.buf, desc = "LSP: [G]oto [D]efinition" })
          vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references,
            { buffer = ev.buf, desc = "LSP: [G]oto [R]eferences" })
          vim.keymap.set('n', 'gI', require('telescope.builtin').lsp_implementations,
            { buffer = ev.buf, desc = "LSP: [G]oto [I]mplementation" })
          vim.keymap.set('n', '<leader>D', require('telescope.builtin').lsp_type_definitions,
            { buffer = ev.buf, desc = "LSP: Type [D]efinition" })
          vim.keymap.set('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols,
            { buffer = ev.buf, desc = "LSP: [D]ocument [S]ymbols" })
          vim.keymap.set('n', '<leader>Ws', require('telescope.builtin').lsp_workspace_symbols,
            { buffer = ev.buf, desc = "LSP: [W]orkspace [S]ymbols" })

          -- See `:help K` for why this keymap
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = ev.buf, desc = "Hover Documentation" })
          vim.keymap.set('n', 'gK', vim.lsp.buf.signature_help,
            { buffer = ev.buf, desc = "LSP: Signature Documentation" })

          -- This works for lua files, but currently not for Python files. Something is wrong with black
          vim.keymap.set('n', '<leader>fb', vim.lsp.buf.format, { buffer = ev.buf, desc = "LSP: [F]ormat [B]uffer" })
        end,
      })
    end
  },
}
