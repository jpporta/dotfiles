-- Keybinds.
-- See https://wiki.hypr.land/Configuring/Basics/Binds/

local p = require("hyprland.programs")

local mod      = "SUPER"
local mod_shft = "SUPER + SHIFT"
local mod_ctrl = "SUPER + CTRL"
local mod_alt  = "SUPER + ALT"

-- ---------- App launchers / global actions ----------
hl.bind(mod      .. " + Return",  hl.dsp.exec_cmd(p.terminal))
hl.bind(mod      .. " + Q",       hl.dsp.window.close())
hl.bind(mod_shft .. " + Q",       hl.dsp.exit())
hl.bind(mod      .. " + E",       hl.dsp.exec_cmd(p.file_manager))
hl.bind(mod      .. " + V",       hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod      .. " + F",       hl.dsp.window.fullscreen())
hl.bind(mod      .. " + N",       hl.dsp.exec_cmd(p.new_note))
hl.bind(mod      .. " + M",       hl.dsp.layout("togglesplit"))            -- dwindle
hl.bind(mod      .. " + Space",   hl.dsp.exec_cmd(p.menu))
hl.bind("CTRL + ALT + DELETE",    hl.dsp.exec_cmd(p.logout_menu))
hl.bind(mod      .. " + T",       hl.dsp.exec_cmd(p.wallpaper_menu))
hl.bind(mod_ctrl .. " + T",       hl.dsp.exec_cmd(p.wallpaper_menu_mine))
hl.bind(mod_shft .. " + T",       hl.dsp.exec_cmd(p.toggle_wallpaper_cycle))
hl.bind(mod_shft .. " + N",       hl.dsp.exec_cmd(p.toggle_notifications))
hl.bind(mod_shft .. " + W",       hl.dsp.exec_cmd(p.open_work_apps))
-- hl.bind(mod      .. " + D",       hl.dsp.exec_cmd(p.task_menu .. " 'Done Task'"))
-- hl.bind(mod_shft .. " + D",       hl.dsp.exec_cmd(p.task_menu .. " 'New Task'"))

-- ---------- Focus movement (vim) ----------
hl.bind(mod      .. " + H", hl.dsp.focus({ direction = "left"  }))
hl.bind(mod      .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mod      .. " + K", hl.dsp.focus({ direction = "up"    }))
hl.bind(mod      .. " + J", hl.dsp.focus({ direction = "down"  }))

-- ---------- Move window ----------
hl.bind(mod_shft .. " + H", hl.dsp.window.move({ direction = "left"  }))
hl.bind(mod_shft .. " + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(mod_shft .. " + K", hl.dsp.window.move({ direction = "up"    }))
hl.bind(mod_shft .. " + J", hl.dsp.window.move({ direction = "down"  }))

-- ---------- Splitratio (dwindle layoutmsg) ----------
hl.bind(mod .. " + comma",  hl.dsp.layout("splitratio -0.1"))
hl.bind(mod .. " + period", hl.dsp.layout("splitratio 0.1"))
-- NOTE: original config also had `bind = $mainMod, code:51, resizeactive, exec 2560 1440`
-- on SUPER+M, which was malformed (resizeactive doesn't accept "exec ..." args) and
-- in practice did nothing while shadowing the togglesplit bind above. Dropped during
-- migration. Re-add a real `hl.dsp.exec_raw("resizeactive exact 2560 1440")` here if
-- you actually want that behavior on a different key.

-- ---------- Workspaces (Y U I O P -> 1..5) ----------
local ws_keys = { Y = 1, U = 2, I = 3, O = 4, P = 5 }
for key, ws in pairs(ws_keys) do
    hl.bind(mod      .. " + " .. key, hl.dsp.focus({ workspace = ws }))
    hl.bind(mod_shft .. " + " .. key, hl.dsp.window.move({ workspace = ws }))
end

-- ---------- Special workspace (scratchpad) ----------
hl.bind(mod      .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mod_shft .. " + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- ---------- Workspace scroll ----------
hl.bind(mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- ---------- Mouse drag/resize ----------
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- ---------- Multimedia (locked + repeating) ----------
local el = { locked = true, repeating = true }
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"),     el)
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),     el)
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),    el)
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),  el)
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl s 10%+"),                          el)
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"),                          el)

-- ---------- Media (locked, no repeat) ----------
local l = { locked = true }
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       l)
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), l)
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), l)
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   l)

-- ---------- Screenshots ----------
hl.bind(mod_shft .. " + 2", hl.dsp.exec_cmd("hyprshot -m output -m DP-1 -o ~/Pictures/Screenshots"))
hl.bind(mod_shft .. " + 3", hl.dsp.exec_cmd("hyprshot -m window -m active -o ~/Pictures/Screenshots"))
hl.bind(mod_shft .. " + 4", hl.dsp.exec_cmd("hyprshot -m region -o ~/Pictures/Screenshots"))

-- Disable animations on the screenshot selection layer
hl.layer_rule({
    name    = "no-anim-selection",
    match   = { namespace = "selection" },
    no_anim = true,
})

hl.bind(mod_shft .. " + 0", hl.dsp.exec_cmd(p.screen_ocr))

-- ---------- Lock / suspend ----------
hl.bind(mod_alt              .. " + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mod .. " + ALT + CTRL + L",     hl.dsp.exec_cmd("systemctl suspend"))

-- ---------- Waybar reload ----------
hl.bind(mod_alt .. " + R", hl.dsp.exec_cmd("/home/jpporta/.config/waybar/scripts/launch.sh"))

-- ---------- Toggle blur / flat decoration ----------
hl.bind(mod_alt .. " + 0", hl.dsp.exec_cmd(p.toggle_look))
