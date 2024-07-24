
local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font({
		family = "BerkeleyMono Nerd Font",
		weight = 600,
		harfbuzz_features = { 'calt=1', 'cling=1', "liga=1"},
})
config.font_size = 18
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.9
config.macos_window_background_blur = 10
return config
