return {
	"windwp/nvim-autopairs",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		require("nvim-autopairs").setup({
			check_ts = true,
			disable_filetype = { "TelescopePrompt", "spectre_panel" },
		})
		require("nvim-treesitter.configs").setup({
			autotag = {
				enable = true,
			},
		})
	end,
}
