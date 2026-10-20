#!/usr/bin/env bash
# Region screenshot with a frozen screen, like Windows' Snipping Tool.
# Usage: snip.sh copy | annotate

pidof slurp > /dev/null && exit 0   # a snip is already in progress

hyprpicker -r -z &      # freeze the screen
picker=$!               # $! = PID of the last background command
sleep 0.2               # let the freeze appear before selecting

# Esc in slurp = cancelled: unfreeze and quit
region=$(slurp) || { kill $picker; exit 0; }

file=$(mktemp --suffix=.png)
grim -g "$region" "$file"
kill $picker            # unfreeze before satty opens, not after you close it

case "$1" in
    annotate) satty --filename "$file" ;;
    *)        wl-copy < "$file" ;;
esac
rm -f "$file"
