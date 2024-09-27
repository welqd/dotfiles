local wezterm = require("wezterm")

local act = wezterm.action

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Fonts
config.font = wezterm.font("FiraCode Nerd Font Mono", { weight = "Regular" })
config.font_size = 12
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
config.warn_about_missing_glyphs = false

-- Color scheme
local gb_bg_dim = "#141617"
local gb_bg = "#1d2021"
local gb_bg3 = "#3c3836"
local gb_fg = "#d4be98"
local gb_red = "#ea6962"
local gb_green = "#a9b665"
local gb_blue = "#7daea3"
local gb_yellow = "#d8a657"
local gb_purple = "#d3869b"
local gb_aqua = "#89b482"
-- local gb_current_word = "#3c3836"
local gb_grey0 = "#7c6f64"

config.color_scheme = "gruvbox_material_dark_medium"
config.color_schemes = {
	["gruvbox_material_dark_medium"] = {
		foreground = gb_fg,
		background = gb_bg,
		cursor_bg = gb_fg,
		cursor_border = gb_fg,
		cursor_fg = gb_bg,
		selection_bg = gb_fg,
		selection_fg = gb_bg3,

		ansi = { gb_bg, gb_red, gb_green, gb_yellow, gb_blue, gb_purple, gb_aqua, gb_fg },
		brights = { gb_bg3, gb_red, gb_green, gb_yellow, gb_blue, gb_purple, gb_aqua, gb_fg },
	},
}

-- Focus follows mouse
config.pane_focus_follows_mouse = true

-- Opacity and padding
-- config.window_background_opacity = 0.90
config.window_padding = {
	top = 15,
	right = 5,
	bottom = 0,
	left = 5,
}

--- Tab settings
-- Fancy bar cannot hide close button
-- https://github.com/wez/wezterm/issues/1560
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.status_update_interval = 1000
config.tab_max_width = 32
config.prefer_to_spawn_tabs = true
config.hide_tab_bar_if_only_one_tab = false

-- Inactive Pane appearance
config.inactive_pane_hsb = {
	saturation = 1.0,
	brightness = 0.75,
}

-- Colors
config.colors = {
	split = gb_blue,
	-- cursor_fg = frappe_base,
	cursor_fg = gb_bg,
	-- cursor_bg = frappe_mauve,
	cursor_bg = gb_fg,
	tab_bar = {
		-- Remove if fancy is true
		-- background = frappe_mantle_a,
		background = gb_bg_dim,
		active_tab = {
			bg_color = gb_bg,
			fg_color = gb_fg,
			intensity = "Bold",
		},
		inactive_tab = {
			bg_color = gb_bg_dim,
			fg_color = gb_grey0,
			intensity = "Bold",
		},
		inactive_tab_hover = {
			bg_color = gb_bg_dim,
			fg_color = gb_grey0,
			intensity = "Bold",
			italic = true,
		},
		-- Uncomment when fancy is true
		-- inactive_tab_edge = 'rgba(48, 52, 70, 0.95)',
	},
}
-- End of tab settings

config.default_cursor_style = 'SteadyBar'
--
-- Disable all keybindings
config.disable_default_key_bindings = true
config.keys = {
	-- Tabs
	{ key = "Enter", mods = "ALT", action = act.SpawnCommandInNewTab({ cwd = wezterm.home_dir }) },
	{ key = "Backslash", mods = "ALT", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "[", mods = "ALT", action = act.MoveTabRelative(-1) },
	{ key = "]", mods = "ALT", action = act.MoveTabRelative(1) },
	{ key = "q", mods = "ALT", action = act.CloseCurrentTab({ confirm = false }) },
	{ key = "1", mods = "ALT", action = act.ActivateTab(0) },
	{ key = "2", mods = "ALT", action = act.ActivateTab(1) },
	{ key = "3", mods = "ALT", action = act.ActivateTab(2) },
	{ key = "4", mods = "ALT", action = act.ActivateTab(3) },
	{ key = "5", mods = "ALT", action = act.ActivateTab(4) },
	{ key = "6", mods = "ALT", action = act.ActivateTab(5) },
	{ key = "7", mods = "ALT", action = act.ActivateTab(6) },
	{ key = "8", mods = "ALT", action = act.ActivateTab(7) },
	{ key = "9", mods = "ALT", action = act.ActivateTab(8) },
	{ key = "0", mods = "ALT", action = act.ActivateTab(9) },
	{ key = "h", mods = "ALT", action = act.ActivateTabRelative(-1) },
	{ key = "l", mods = "ALT", action = act.ActivateTabRelative(1) },
	-- Panes
	{ key = "Enter", mods = "SHIFT|ALT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "|", mods = "SHIFT|ALT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "q", mods = "SHIFT|ALT", action = act.CloseCurrentPane({ confirm = false }) },
	{ key = "h", mods = "SHIFT|ALT", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "SHIFT|ALT", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "SHIFT|ALT", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "SHIFT|ALT", action = act.ActivatePaneDirection("Right") },
	{ key = "{", mods = "SHIFT|ALT", action = act.AdjustPaneSize({ "Left", 1 }) },
	{ key = "}", mods = "SHIFT|ALT", action = act.AdjustPaneSize({ "Right", 1 }) },
	{ key = "_", mods = "SHIFT|ALT", action = act.AdjustPaneSize({ "Up", 1 }) },
	{ key = "+", mods = "SHIFT|ALT", action = act.AdjustPaneSize({ "Down", 1 }) },
	{ key = "o", mods = "SHIFT|ALT", action = act.PaneSelect({ mode = "MoveToNewTab" }) },
	{ key = "p", mods = "SHIFT|ALT", action = act.PaneSelect({ mode = "SwapWithActiveKeepFocus" }) },
	-- Clipboard
	{ key = "v", mods = "SHIFT|CTRL", action = act.PasteFrom("Clipboard") },
	{ key = "c", mods = "SHIFT|CTRL", action = act.CopyTo("Clipboard") },
	-- Scrolling
	{ key = "UpArrow", mods = "SHIFT", action = act.ScrollByLine(-1) },
	{ key = "k", mods = "CTRL|ALT", action = act.ScrollByLine(-1) },
	{ key = "DownArrow", mods = "SHIFT", action = act.ScrollByLine(1) },
	{ key = "j", mods = "CTRL|ALT", action = act.ScrollByLine(1) },
	-- Copy mode
	{ key = "Space", mods = "SHIFT|ALT", action = act.ActivateCopyMode },
}
-- Key tables
config.key_tables = {
	copy_mode = {
		{ key = "Escape", mods = "NONE", action = act.CopyMode("Close") },
		{ key = "q", mods = "NONE", action = act.CopyMode("Close") },
		{ key = "$", mods = "SHIFT", action = act.CopyMode("MoveToEndOfLineContent") },
		{ key = "0", mods = "NONE", action = act.CopyMode("MoveToStartOfLine") },
		{ key = "h", mods = "NONE", action = act.CopyMode("MoveLeft") },
		{ key = "j", mods = "NONE", action = act.CopyMode("MoveDown") },
		{ key = "k", mods = "NONE", action = act.CopyMode("MoveUp") },
		{ key = "l", mods = "NONE", action = act.CopyMode("MoveRight") },
		{ key = "w", mods = "NONE", action = act.CopyMode("MoveForwardWord") },
		{ key = "b", mods = "NONE", action = act.CopyMode("MoveBackwardWord") },
		{ key = "g", mods = "NONE", action = act.CopyMode("MoveToScrollbackTop") },
		{ key = "G", mods = "SHIFT", action = act.CopyMode("MoveToScrollbackBottom") },
		{ key = "V", mods = "SHIFT", action = act.CopyMode({ SetSelectionMode = "Line" }) },
		{ key = "v", mods = "NONE", action = act.CopyMode({ SetSelectionMode = "Cell" }) },
		{
			key = "y",
			mods = "NONE",
			action = act.Multiple({ { CopyTo = "ClipboardAndPrimarySelection" }, { CopyMode = "Close" } }),
		},
	},
}

return config
