#!/usr/bin/env bash
# Power menu for the Waybar power button, shown as a fuzzel list

choice=$(printf '%s\n' "Logout" "Suspend" "Reboot" "Shutdown" |
    fuzzel --dmenu --prompt "Power: " --lines 4)

case "$choice" in
    Logout)   hyprctl dispatch 'hl.dsp.exit()' ;;
    Suspend)  systemctl suspend ;;
    Reboot)   systemctl reboot ;;
    Shutdown) systemctl poweroff ;;
esac
