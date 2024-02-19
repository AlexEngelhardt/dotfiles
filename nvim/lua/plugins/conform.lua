-- I failed to set up linting and formatting with none-ls.
-- It worked for Lua, but not for Python/black.
-- conform.nvim seems to be a good alternative
--
-- You must install black, isort, etc. manually so the CLI program is available, though!
return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform will run multiple formatters sequentially:
				python = { "isort", "black" },
				-- Use a sub-list to run only the first available formatter
				-- javascript = { { "prettierd", "prettier" } },

				-- sql = { "sql_formatter" },  -- TODO

				-- r = { "styler" },  -- doesn't work somehow

        -- markdown = { "mdformat" },  -- not pretty list formatting :(
			},
		})
		vim.keymap.set("n", "<leader>fb", conform.format, { desc = "[F]ormat [B]uffer" })
	end,
}
