#!/bin/bash

### A SCRIPT TO CHANGE WALLPAPER + TERMINAL COLORS WITH PYWAL + HYPRPAPER ###

# No Arguments: open file selector.
# 1 Argument: use the argument passed as path to file.

if [ "$#" -eq 1 ]; then
    if [[ -f "$1" ]]; then
        SELECTED_WALLPAPER="$1"
    else
        echo "File not found."
        exit 1
    fi
else
    WALLPAPER_DIR="$HOME/Wallpapers"
    SELECTED_WALLPAPER=$(zenity --file-selection --title="Chose an File" --filename="$WALLPAPER_DIR/")
fi

if [ -z "$SELECTED_WALLPAPER" ]; then
    echo "None picture selected. Exiting."
    exit 0
fi

echo "Aplying wallpaper: $SELECTED_WALLPAPER"

MONITOR=$(hyprctl monitors | grep "focused: yes" -B 10 | grep "Monitor" | awk '{print $2}')

hyprctl hyprpaper preload "$SELECTED_WALLPAPER"
hyprctl hyprpaper wallpaper "$MONITOR,$SELECTED_WALLPAPER"

wal -i "$SELECTED_WALLPAPER" -q -n

echo "$SELECTED_WALLPAPER" > ~/.cache/current_wallpaper

echo "✨ Theme and wallpaper updated! ✨"
