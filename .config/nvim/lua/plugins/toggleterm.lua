return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		event = "VeryLazy",
		opts = {
			direction = "float",
			open_mapping = [[<C-\>]],
			float_opts = {
				border = "curved",
				width = 120,
				height = 25,
			},
		},
	},
}
