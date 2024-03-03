return {
	"stevearc/oil.nvim",
	config = function()
		require("oil").setup({
			columns = {
				"icon",
			},
			keymaps = {
				q = "actions.close",
				Q = "actions.close",
				["<Esc>"] = { callback = "actions.close", mode = "n" },
			},
			float = {
				max_width = 70,
				max_height = 20,
			},
		})
		vim.keymap.set("n", "~", "<CMD>Oil --float<CR>")
	end,
}
