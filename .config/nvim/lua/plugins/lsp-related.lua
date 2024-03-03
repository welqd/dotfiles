return {
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					border = "single",
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "html", "marksman", "pyright", "ruff_lsp", "bashls", "cssls", "gopls" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("lspconfig.ui.windows").default_options.border = "single"
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({ capabilities = capabilities })
			lspconfig.html.setup({ capabilities = capabilities })
			lspconfig.marksman.setup({ capabilities = capabilities })
			lspconfig.pyright.setup({ capabilities = capabilities })
			-- lspconfig.ruff_lsp.setup({ capabilities = capabilities })
			lspconfig.bashls.setup({ capabilities = capabilities })
			lspconfig.cssls.setup({ capabilities = capabilities })
			lspconfig.gopls.setup({
				settings = {
					gopls = {
						gofumpt = true,
					},
				},
			})
			local opts = { noremap = true, silent = true }
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
		end,
	},
	-- 	{
	-- 		"jay-babu/mason-null-ls.nvim",
	-- 		event = { "BufReadPre", "BufNewFile" },
	-- 		config = function()
	-- 			require("mason").setup()
	-- 			require("mason-null-ls").setup({
	-- 				ensure_installed = {
	-- 					"prettier",
	-- 					"djlint",
	-- 					"markdownlint",
	-- 					"stylua",
	-- 					"shfmt",
	-- 					-- "black",
	-- 					-- "isort",
	-- 					-- "flake8",
	-- 					"gofumpt",
	-- 					"revive",
	-- 					"stylelint",
	-- 				},
	-- 			})
	-- 		end,
	-- 	},
}
