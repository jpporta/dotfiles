#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Github : @adi1090x
#
## Rofi   : Launcher (Modi Drun, Run, File Browser, Window)
#
## Available Styles
#
## style-1     style-2     style-3     style-4     style-5
## style-6     style-7     style-8     style-9     style-10

dir="$HOME/.config/rofi/launchers/type-7"
theme='style-5'

read -r meeting < <(next-meeting 2>/dev/null)
IFS=$'\t' read -r meeting_type label url <<< "$meeting"

actions=()
entries_file=$(mktemp)
trap 'rm -f "$entries_file"' EXIT

add_entry() {
  printf '%s\n' "$1" >> "$entries_file"
  actions+=("$2")
}

add_icon_entry() {
  printf '%s\0icon\x1f%s\n' "$1" "$2" >> "$entries_file"
  actions+=("$3")
}

add_desktop_entries() {
  local app_dir="$1"
  local desktop_file desktop_id line key value name icon type hidden no_display

  [[ -d "$app_dir" ]] || return

  shopt -s nullglob globstar
  for desktop_file in "$app_dir"/**/*.desktop; do
    [[ -f "$desktop_file" ]] || continue

    desktop_id=${desktop_file#"$app_dir"/}
    name=
    icon=
    type=
    hidden=false
    no_display=false

    while IFS= read -r line; do
      [[ "$line" == *=* ]] || continue
      key=${line%%=*}
      value=${line#*=}

      case "$key" in
        Name) name=$value ;;
        Icon) icon=$value ;;
        Type) type=$value ;;
        Hidden) hidden=$value ;;
        NoDisplay) no_display=$value ;;
      esac
    done < "$desktop_file"

    [[ "$type" == "Application" && -n "$name" && "$hidden" != "true" && "$no_display" != "true" ]] || continue

    if [[ -n "$icon" ]]; then
      add_icon_entry "$name" "$icon" "app:$desktop_id"
    else
      add_entry "$name" "app:$desktop_id"
    fi
  done
}

[[ "$meeting_type" == "MEETING" && -n "$label" && -n "$url" ]] && add_icon_entry "$label" "x-office-calendar" "url:$url"

add_desktop_entries "$HOME/.local/share/applications"
add_desktop_entries "/usr/local/share/applications"
add_desktop_entries "/usr/share/applications"

choice=$(rofi -theme "$dir/$theme.rasi" -dmenu -i -p "Launcher" -format i < "$entries_file")

[[ -z "$choice" ]] && exit 0

action=${actions[$choice]}

case "$action" in
  url:*)
    zen-browser "${action#url:}" >/dev/null 2>&1 &
    ;;

  app:*)
    gtk-launch "${action#app:}" >/dev/null 2>&1 &
    ;;
esac
