---@diagnostic disable: param-type-mismatch
return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local xkb_switch_lib = nil
		local all_libs_locations = vim.fn.systemlist("ldd $(which xkb-switch)")
		for _, value in ipairs(all_libs_locations) do
			if string.find(value, "libxkbswitch") then
				xkb_switch_lib = string.sub(value, string.find(value, "/"), string.find(value, "%(") - 2)
			end
		end

		local function get_current_layout()
			return vim.fn.libcall(xkb_switch_lib, "Xkb_Switch_getXkbLayout", "")
		end


		require("lualine").setup({
			options = {
				theme = "auto",
				component_separators = { left = "|", right = "|" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diagnostics" },
				lualine_x = { get_current_layout, "encoding", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		})
	end,
}
