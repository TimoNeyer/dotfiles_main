#!/bin/bash

if command -v pactl &>/dev/null; then
    SINK=$(pactl get-default-sink)
    VOLUME=$(pactl get-sink-volume "$SINK" | cut -d ' ' -f 5)
    echo "$VOLUME"

elif command -v wpctl &>/dev/null; then
    VOLUME=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2 * 100 "%"}')
    echo "$VOLUME"

else
    echo "Error: PulseAudio and PipeWire missing!"
    exit 1
fi
