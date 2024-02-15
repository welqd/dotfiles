return {
	"/nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua, -- an opinionated code formatter for lua
				null_ls.builtins.formatting.shfmt, -- a shell parser, formatter, and interpreter with bash support
				null_ls.builtins.formatting.black, -- the uncompromising python code formatter
				null_ls.builtins.formatting.isort, -- sort python imports alphabetically
				null_ls.builtins.formatting.prettier, -- is an opinionated code formatter.
				null_ls.builtins.formatting.djlint, -- html template linter and formatter 
				null_ls.builtins.formatting.markdownlint, -- a checker and lint tool for markdown
				null_ls.builtins.formatting.gofumpt, -- a go formatter
				null_ls.builtins.diagnostics.djlint, -- html template linter and formatter 
				null_ls.builtins.diagnostics.revive, -- a linter for go
        null_ls.builtins.diagnostics.markdownlint, -- a checker and lint tool for markdown
				null_ls.builtins.diagnostics.flake8.with({
					prefer_local = "venv/bin",
				}), -- a python tool that checks the style and quality of python code
			},
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
