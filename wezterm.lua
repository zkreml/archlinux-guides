-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.color_scheme = "Dark Ocean (terminal.sexy)"

config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 12

config.enable_tab_bar = false

config.window_decorations = "RESIZE"

config.window_background_opacity = 1.0
config.keys = {
	-- Přepínání mezi panely pomocí Alt + šipek
	{ key = "LeftArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "RightArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Right") },
	{ key = "UpArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Up") },
	{ key = "DownArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Down") },

	-- Rozdělení panelu
	{ key = "d", mods = "CTRL|SHIFT", action = wezterm.action.SplitHorizontal({}) },
	{ key = "e", mods = "CTRL|SHIFT", action = wezterm.action.SplitVertical({}) },

	-- Zavření panelu
	{ key = "w", mods = "CTRL|SHIFT", action = wezterm.action.CloseCurrentPane({ confirm = true }) },

	-- Nový tab
	{ key = "t", mods = "CTRL", action = wezterm.action.SpawnTab("DefaultDomain") },
}

-- and finally, return the configuration to wezterm
return config
