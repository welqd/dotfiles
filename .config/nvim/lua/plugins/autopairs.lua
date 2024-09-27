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
		require("nvim-ts-autotag").setup({
			opts = {
				enable_close = true,
				enable_rename = true,
				enable_close_on_slash = false,
			},
		})
	end,
}
