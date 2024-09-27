return {
	"sainnhe/gruvbox-material",
	lazy = false,
	priority = 1000,
	config = function()
		vim.g.gruvbox_material_foreground = "material"
		vim.g.gruvbox_material_background = "hard"
		vim.g.gruvbox_material_float_style = "dim"
		vim.g.gruvbox_material_diagnostic_text_highlight = 1
		vim.g.gruvbox_material_enable_italic = 0
		vim.g.gruvbox_material_better_performance = 1
		vim.g.gruvbox_material_transparent_background = 1
		vim.cmd.colorscheme("gruvbox-material")
	end,
}
