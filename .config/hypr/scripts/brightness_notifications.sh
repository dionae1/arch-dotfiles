#!/bin/bash
# ~/.config/hypr/scripts/brightness_notification.sh
BRIGHTNESS=$(brightnessctl -m | awk -F, '{print $4}' | tr -d '%')
notify-send -h string:x-canonical-private-synchronous:brightness_notif -u low -i display-brightness "Brilho" "${BRIGHTNESS}%"
