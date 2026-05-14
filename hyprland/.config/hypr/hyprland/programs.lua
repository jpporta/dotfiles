-- Programs / commands used by binds and autostart.
-- Equivalent of the old programs.conf $vars.

local home = os.getenv("HOME")

return {
    terminal               = "kitty",
    file_manager           = "thunar",
    menu                   = "pkill rofi || " .. home .. "/.config/rofi/launchers/type-7/launcher.sh",
    logout_menu            = "wlogout -b 5 -T 400 -B 400",
    wallpaper_menu         = home .. "/.local/bin/chwal",
    wallpaper_menu_mine    = home .. "/.local/bin/chwal-me",
    theme_menu             = home .. "/.local/bin/chthm",
    toggle_notifications   = "swaync-client -t -sw",
    task_menu              = home .. "/.local/bin/done-task-menu",
    toggle_look            = home .. "/.local/bin/toggle-decoration",
    new_note               = home .. "/.local/bin/add-note",
    open_work_apps         = home .. "/.local/bin/open-work-apps",
    screen_ocr             = home .. "/.local/bin/read-screen",
    -- Multi-line shell command kept as one string; runs under sh -c via exec_cmd.
    toggle_wallpaper_cycle = [[if [ $(cat $HOME/.local/state/cycle_wallpaper) == "1" ]; then echo "0" > $HOME/.local/state/cycle_wallpaper; notify-send "Wallpaper Cycle Turned Off"; else echo "1" > $HOME/.local/state/cycle_wallpaper; notify-send "Wallpaper Cycle Turned On"; fi]],
}
