-- Autostart processes.
-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
--    hl.exec_cmd("hypridle")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("swaync")
    hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
		hl.exec_cmd("hyprctl setcursor Bibata-Modern-Ice-Right 24")
		hl.exec_cmd("/usr/bin/gnome-keyring-daemon --start --components=secrets")
		hl.exec_cmd("systemctl --user start hyprland-session.target")
end)
