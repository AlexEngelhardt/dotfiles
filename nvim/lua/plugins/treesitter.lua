return {
  -- Highlight, edit, and navigate code
  -- Treesitter generates an abstract syntax tree out of
  --   your code. *Parsers* can then use this AST.
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  build = ':TSUpdate',
  opts = {
    ensure_installed = { 'python' }
  },
  config = function()

    ----------------------------------------------------------------
    -- Configure Treesitter

    -- See `:help nvim-treesitter`
    -- Defer Treesitter setup after first render to improve startup time of 'nvim {filename}'
    vim.defer_fn(function()
      require('nvim-treesitter.configs').setup {
        -- Add languages to be installed here that you want installed for treesitter
        ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'javascript', 'typescript', 'vimdoc', 'vim', 'bash' },

        -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
        auto_install = false,
        -- Install languages synchronously (only applied to `ensure_installed`)
        sync_install = false,
        -- List of parsers to ignore installing
        ignore_install = {},
        -- You can specify additional Treesitter modules here: -- For example: -- playground = {--enable = true,-- },
          modules = {},
          highlight = { enable = true },
          indent = {
            enable = true,
            disable = {
              "markdown",  -- indentation at bullet points is worse than with the builtin formatter
            }
          },
          incremental_selection = {
            enable = true,
            keymaps = {
              init_selection = '<c-space>',
              node_incremental = '<c-space>',
              scope_incremental = '<c-s>',
              node_decremental = '<M-space>',
            },
          },
          textobjects = {
            select = {
              enable = true,
              lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
              keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ['aa'] = { query='@parameter.outer', desc='around parameter' },
                ['ia'] = { query='@parameter.inner', desc='inner parameter' },
                ['af'] = { query='@function.outer', desc='around function' },
                ['if'] = { query='@function.inner', desc='inner function' },
                ['ac'] = { query='@class.outer', desc='around class' },
                ['ic'] = { query='@class.inner', desc='inner class' },
              },
            },
            move = {
              enable = true,
              set_jumps = true, -- whether to set jumps in the jumplist
              goto_next_start = {
                -- <Alex> Somehow the @function.outer automatically are documented as "Next method start" in which-key,
                -- but `]]` gets a weird "Goto next start @class.outer" kinda doc
                [']m'] = '@function.outer',  
                [']]'] = { query='@class.outer', desc='Next class start' },
              },
              goto_next_end = {
                [']M'] = '@function.outer',
                [']['] = { query='@class.outer', desc='Next class end' },
              },
              goto_previous_start = {
                ['[m'] = '@function.outer',
                ['[['] = { query='@class.outer', desc='Previous class start' },
              },
              goto_previous_end = {
                ['[M'] = '@function.outer',
                ['[]'] = { query='@class.outer', desc='Previous class end' },
              },
            },
            swap = {
              enable = true,
              swap_next = {
                ['<leader>a'] = '@parameter.inner',
              },
              swap_previous = {
                ['<leader>A'] = '@parameter.inner',
              },
            },
          },
        }
      end, 0)

    end
  }
