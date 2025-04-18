local wezterm = require("wezterm")
local config = wezterm.config_builder()
config.color_scheme = "Catppuccin Mocha"
config.max_fps = 240
config.font = wezterm.font_with_fallback {
	'JetBrainsMono Nerd Font Mono',
	'Font Awesome 6',
	'Noto Color Emoji',
}
config.font_rules = {
	{

		intensity = "Bold",
		italic = true,
		font = wezterm.font({
			family = "JetBrainsMono Nerd Font",
			weight = 800,
			style = "Italic",
			harfbuzz_features = { "calt=0", "cling=0", "liga=0" },
		}),
	},
	{

		intensity = "Bold",
		font = wezterm.font({
			family = "JetBrainsMono Nerd Font",
			weight = 800,
			harfbuzz_features = { "calt=0", "cling=0", "liga=0" },
		}),
	},
	{

		italic = true,
		font = wezterm.font({
			family = "JetBrainsMono Nerd Font",
			weight = 600,
			style = "Italic",
			harfbuzz_features = { "calt=0", "cling=0", "liga=0" },
		}),
	},
	{

		font = wezterm.font({
			family = "JetBrainsMono Nerd Font",
			weight = 600,
			harfbuzz_features = { "calt=0", "cling=0", "liga=0" },
		}),
	},
}
config.font_size = 13
config.enable_tab_bar = false
config.window_decorations = "NONE"
config.window_background_opacity = 0.9
config.macos_window_background_blur = 20
return config
