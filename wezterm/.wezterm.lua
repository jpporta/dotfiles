local wezterm = require 'wezterm'
local config = wezterm.config_builder()
config.color_scheme = "Catppuccin Mocha"
config.max_fps = 240
config.font = wezterm.font_with_fallback({
	"BerkeleyMono Nerd Font Mono",
	"Font Awesome 6",
	"Noto Color Emoji",
})

config.font_size = 10.7
config.enable_tab_bar = false
config.window_background_opacity = 0.7
return config
