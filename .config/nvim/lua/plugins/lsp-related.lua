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
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					-- Enable completion triggered by <c-x><c-o>
					vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
					-- Buffer local mappings.
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					local opts = { buffer = ev.buf }
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
					vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "<leader>gf", function()
						vim.lsp.buf.format({ async = true })
					end, opts)
				end,
			})
			require("lspconfig").efm.setup({
				init_options = { documentFormatting = true },
				settings = {
					rootMarkers = { ".git/" },
					languages = {
						lua = {
							require("efmls-configs.linters.luacheck"),
							require("efmls-configs.formatters.stylua"),
						},
						markdown = {
							require("efmls-configs.linters.markdownlint"),
							require("efmls-configs.formatters.mdformat"),
						},
						html = {
							require("efmls-configs.linters.djlint"),
							require("efmls-configs.formatters.prettier"),
						},
						css = {
							require("efmls-configs.linters.stylelint"),
							require("efmls-configs.formatters.prettier"),
						},
						go = {
							require("efmls-configs.linters.go_revive"),
							require("efmls-configs.formatters.gofumpt"),
						},
						python = {
							require("efmls-configs.linters.flake8"),
							require("efmls-configs.formatters.black"),
							require("efmls-configs.formatters.isort"),
						},
					},
				},
			})
		end,
	},
}
