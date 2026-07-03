#!/usr/bin/env bash
# Waybar custom module: obs-recording
#
# Emits JSON for waybar with the current OBS recording state.
# Outputs an empty JSON object when OBS is not running so waybar
# hides the module (requires no explicit `format` when empty).
#
# States (exposed via `alt` and `class`):
#   stopped   - OBS running, not recording
#   recording - OBS running, recording, not paused
#   paused    - OBS running, recording, paused

set -u

# Bail out (hide module) if OBS is not running.
if ! pgrep obs >/dev/null 2>&1; then
  printf '{}\n'
  exit 0
fi

status_output="$(obs-cmd recording status 2>/dev/null)"

active="$(printf '%s\n' "$status_output" | awk -F': *' '/Active:/ {print $2; exit}')"
paused="$(printf '%s\n' "$status_output" | awk -F': *' '/Paused:/ {print $2; exit}')"
timecode="$(printf '%s\n' "$status_output" | awk -F': *' '/Timecode:/ {print $2; exit}')"

if [ "$active" != "true" ]; then
  state="stopped"
  icon=""
  tooltip="OBS: not recording"
elif [ "$paused" = "true" ]; then
  state="paused"
  icon=""
  tooltip="OBS: paused (${timecode:-0})"
else
  state="recording"
  icon="󰑊"
  tooltip="OBS: recording (${timecode:-0})"
fi

# Escape double quotes in tooltip just in case.
tooltip_escaped="${tooltip//\"/\\\"}"

printf '{"text":"%s","alt":"%s","class":"%s","tooltip":"%s"}\n' \
  "$icon" "$state" "$state" "$tooltip_escaped"
