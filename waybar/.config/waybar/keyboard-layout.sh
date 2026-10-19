#!/usr/bin/env bash
# Prints the active keyboard layout as a short code ("us" / "lt") for Waybar

# Use the main keyboard; fall back to the first one if none is marked main
layout=$(hyprctl devices -j |
    jq -r '[.keyboards[] | select(.main)][0] // .keyboards[0] | .active_keymap')

case "$layout" in
    "English (US)") echo "us" ;;
    Lithuanian*)    echo "lt" ;;
    *)              echo "${layout:0:2}" | tr '[:upper:]' '[:lower:]' ;;
esac
