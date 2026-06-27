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
cache_dir="${XDG_CACHE_HOME:-$HOME/.cache}"
drun_cache="$cache_dir/rofi3.druncache"
desktop_dirs=("$HOME/.local/share/applications" "/usr/local/share/applications" "/usr/share/applications")

read -r meeting < <(next-meeting 2>/dev/null)
IFS=$'\t' read -r meeting_type label url <<< "$meeting"

actions=()
entries_file=$(mktemp)
trap 'rm -f "$entries_file"' EXIT
declare -A seen_desktop_ids=()

add_entry() {
  printf '%s\n' "$1" >> "$entries_file"
  actions+=("$2")
}

add_icon_entry() {
  printf '%s\0icon\x1f%s\n' "$1" "$2" >> "$entries_file"
  actions+=("$3")
}

add_desktop_file() {
  local app_dir="$1"
  local desktop_file="$2"
  local desktop_id line key value name icon type hidden no_display

  [[ -f "$desktop_file" ]] || return

  desktop_id=${desktop_file#"$app_dir"/}
  [[ -n "${seen_desktop_ids[$desktop_id]}" ]] && return

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

  [[ "$type" == "Application" && -n "$name" && "$hidden" != "true" && "$no_display" != "true" ]] || return

  seen_desktop_ids[$desktop_id]=1

  if [[ -n "$icon" ]]; then
    add_icon_entry "$name" "$icon" "app:$desktop_id"
  else
    add_entry "$name" "app:$desktop_id"
  fi
}

add_desktop_id() {
  local desktop_id="$1"
  local app_dir desktop_file

  for app_dir in "${desktop_dirs[@]}"; do
    desktop_file="$app_dir/$desktop_id"
    [[ -f "$desktop_file" ]] && add_desktop_file "$app_dir" "$desktop_file" && return
  done
}

add_cached_desktop_entries() {
  local count desktop_id

  [[ -f "$drun_cache" ]] || return

  while read -r count desktop_id; do
    [[ -n "$desktop_id" ]] && add_desktop_id "$desktop_id"
  done < "$drun_cache"
}

add_all_desktop_entries() {
  local app_dir desktop_file

  app_dir="$1"
  [[ -d "$app_dir" ]] || return

  shopt -s nullglob globstar
  for desktop_file in "$app_dir"/**/*.desktop; do
    add_desktop_file "$app_dir" "$desktop_file"
  done
}

update_drun_cache() {
  local desktop_id="$1"
  local tmp_cache

  mkdir -p "$cache_dir"
  touch "$drun_cache"
  tmp_cache=$(mktemp)
  awk -v app="$desktop_id" '
    $2 == app { $1 += 1; found = 1 }
    { print }
    END { if (!found) print 1, app }
  ' "$drun_cache" 2>/dev/null | sort -rn > "$tmp_cache"
  mv "$tmp_cache" "$drun_cache"
}

[[ "$meeting_type" == "MEETING" && -n "$label" && -n "$url" ]] && add_icon_entry "$label" "x-office-calendar" "url:$url"

add_cached_desktop_entries

for app_dir in "${desktop_dirs[@]}"; do
  add_all_desktop_entries "$app_dir"
done

choice=$(rofi -theme "$dir/$theme.rasi" -dmenu -i -p "Launcher" -format i < "$entries_file")

[[ -z "$choice" ]] && exit 0

action=${actions[$choice]}

case "$action" in
  url:*)
    zen-browser "${action#url:}" >/dev/null 2>&1 &
    ;;

  app:*)
    app=${action#app:}
    update_drun_cache "$app"
    gtk-launch "$app" >/dev/null 2>&1 &
    ;;
esac
