return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		local function button(sc, txt, keybind, keybind_opts)
			local b = dashboard.button(sc, txt, keybind, keybind_opts)
			b.opts.hl_shortcut = "Macro"
			return b
		end

		dashboard.section.header.val = {
			[[                              _____ ]],
			[[ _____ _____ __    __    ____|___  |]],
			[[|  |  |   __|  |  |  |  |     ||  _|]],
			[[|     |   __|  |__|  |__|  |  ||_|  ]],
			[[|__|__|_____|_____|_____|_____||_|  ]],
		}
		dashboard.section.buttons.val = {
			button("e", " " .. " New file", ":ene <BAR> startinsert <CR>"),
			button("f", " " .. " Find file", ":Telescope find_files <CR>"),
			button("c", " " .. " Config Directory", ":e ~/.config/nvim/ <CR>"),
			button("q", " " .. " Quit", ":qa<CR>"),
		}
		dashboard.section.header.opts.hl = "String"
		dashboard.section.buttons.opts.hl = "Macro"
		dashboard.section.footer.opts.hl = "Type"

		dashboard.opts.opts.noautocmd = true
		alpha.setup(dashboard.opts)
	end,
}
