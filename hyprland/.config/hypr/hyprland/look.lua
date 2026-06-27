-- Look & feel: blur vs flat decoration profile.
-- The active profile is selected by the contents of ~/.local/state/hypr-look
-- ("blur" or "flat"). Default is "blur".
-- Toggle with: ~/.local/bin/toggle-decoration   (then `hyprctl reload`)

local colors = require("hyprland.colors")

-- Environment + input + general bits common to both profiles
hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Ice-Right")
hl.env("HYPRCURSOR_SIZE", "24")

hl.config({
    input = {
        kb_layout  = "us,us",
        kb_variant = ",intl",
        kb_options = "grp:alt_shift_toggle",
    },
    general = {
        gaps_in     = 7,
        gaps_out    = 10,
        border_size = 2,
        col = {
            active_border   = colors.primary      or "rgba(ebcc71ff)",
            inactive_border = colors.on_secondary or "rgba(54461eff)",
        },
        layout = "dwindle",
    },
    scrolling = {
        fullscreen_on_one_column = true,
        column_width             = 0.95,
        focus_fit_method         = 0,
    },
    dwindle = {
        preserve_split = true,
    },
    master = {
        new_status           = "slave",
        allow_small_split    = false,
        special_scale_factor = 0.75,
        mfact                = 0.40,
        orientation          = "center",
        new_on_top           = true,
    },
})

hl.device({
    name               = "8bitdo-retro-18-numpad-keyboard",
    kb_options         = "numpad:mac",
    numlock_by_default = true,
})

-- Read profile selection
local function read_profile()
    local state_path = os.getenv("HOME") .. "/.local/state/hypr-look"
    local f = io.open(state_path, "r")
    if not f then return "blur" end
    local v = (f:read("*l") or ""):gsub("%s+", "")
    f:close()
    if v == "flat" then return "flat" end
    return "blur"
end

local profile = read_profile()

if profile == "blur" then
    hl.config({
        decoration = {
            rounding         = 15,
            rounding_power   = 2,
            active_opacity   = 1.0,
            inactive_opacity = 0.75,
            fullscreen_opacity = 1.0,
            blur = {
                enabled           = true,
                size              = 1,
                passes            = 2,
                new_optimizations = true,
                vibrancy          = 0.5,
                vibrancy_darkness = 0.2,
            },
            shadow = {
                enabled      = true,
                range        = 15,
                render_power = 3,
                color        = "rgba(121212aa)",
            },
        },
    })

    -- swaync layer rules (only meaningful with blur on)
    hl.layer_rule({
        name  = "swaync-control-center-blur",
        match = { namespace = "swaync-control-center" },
        blur            = true,
        dim_around      = true,
        ignore_alpha    = 0.5,
        no_screen_share = true,
    })
    hl.layer_rule({
        name  = "swaync-notification-blur",
        match = { namespace = "swaync-notification-window" },
        blur            = true,
        ignore_alpha    = 0.5,
        no_screen_share = true,
    })
else -- flat
    hl.config({
        decoration = {
            rounding         = 15,
            rounding_power   = 2,
            active_opacity   = 1.0,
            inactive_opacity = 1.0,
            fullscreen_opacity = 1.0,
            blur = {
                enabled           = false,
                size              = 4,
                passes            = 2,
                new_optimizations = true,
                vibrancy          = 0.5,
                vibrancy_darkness = 0.2,
            },
            shadow = {
                enabled      = false,
                range        = 15,
                render_power = 3,
                color        = "rgba(121212aa)",
            },
        },
    })
end
