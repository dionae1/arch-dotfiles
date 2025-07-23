#!/bin/bash
# ~/.config/hypr/scripts/volume_notification.sh
MUTED=$(pamixer --get-mute)
VOLUME=$(pamixer --get-volume)

if [ "$MUTED" = "true" ]; then
    notify-send -h string:x-canonical-private-synchronous:volume_notif -u low -i notification-audio-volume-muted "Volume" "Silenciado"
else
    notify-send -h string:x-canonical-private-synchronous:volume_notif -u low -i notification-audio-volume-high "Volume" "${VOLUME}%"
fi

