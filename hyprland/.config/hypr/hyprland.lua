-- Hyprland configuration entrypoint (Lua, Hyprland 0.55+).
-- Migrated from the old hyprlang split layout. Each subfile mirrors the
-- corresponding old .conf file under ./hyprland/.
--
-- Reload with `hyprctl reload`.

-- Make `require("hyprland.<name>")` resolve from this directory regardless
-- of CWD (Hyprland is normally launched from $HOME).
local config_dir = os.getenv("HOME") .. "/.config/hypr"
package.path = config_dir .. "/?.lua;" .. config_dir .. "/?/init.lua;" .. package.path

require("hyprland.monitors")
require("hyprland.programs") -- pure module (returns table); pre-load is harmless
require("hyprland.look") -- input + general + decoration (blur/flat profile)
require("hyprland.animations")
require("hyprland.autostart")
require("hyprland.binds")

-- ---------- misc ----------
hl.config({
	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = true,
	},
})

-- ---------- window rules ----------

-- Ignore maximize requests from apps.
hl.window_rule({
	name = "Ignore Maximize Requests",
	match = { class = ".*" },
	suppress_event = "maximize",
})

-- Fix some dragging issues with XWayland.
hl.window_rule({
	name = "XWayland Drag Fix",
	match = {
		xwayland = 1,
		title = "^$",
		class = "^$",
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_focus = true,
})

-- Picture-in-Picture: pinned floating mini-player in bottom-right quadrant.
hl.window_rule({
	name = "PIP",
	match = { title = "Picture-in-Picture" },
	pin = 1,
	float = 1,
	size = "(monitor_w/4) (monitor_h/4)",
	move = "(3*monitor_w/4)-22 (monitor_h-window_h-22)",
})

hl.env("QT_QPA_PLATFORMTHEME", "hyprqt6engine")
