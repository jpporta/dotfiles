-- Monitor configuration.
-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

-- HOME
hl.monitor({
    output   = "DP-1",
    mode     = "1920x1080@239.96Hz",
    position = "1080x0",
    scale    = 1,
})

hl.monitor({
    output   = "HDMI-A-1",
    mode     = "1920x1080@120Hz",
		transform = 1,
    position = "0x520",
    scale    = 1,
		})

-- JANA (uncomment to use)
-- hl.monitor({
--     output   = "",
--     mode     = "2560x1080@59.98Hz",
--     position = "auto",
--     scale    = 1,
-- })
