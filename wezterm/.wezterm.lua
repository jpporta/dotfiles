local wezterm = require("wezterm")
local config = wezterm.config_builder()
config.color_scheme = "Catppuccin Mocha"
config.max_fps = 240
config.font = wezterm.font_with_fallback({
	"Terminess Nerd Font",
	"Font Awesome 6",
	"Noto Color Emoji",
})

config.font_size = 16
config.enable_tab_bar = false
config.window_background_opacity = 0.9
config.macos_window_background_blur = 20
return config
