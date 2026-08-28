#!/bin/bash

set -u

sleep 0.05
win_id=$(xdotool getwindowfocus 2>/dev/null) || exit 0

if [ -z "$win_id" ] || [ "$win_id" = "0" ]; then
    exit 0
fi

eval "$(xdotool getwindowgeometry --shell "$win_id" 2>/dev/null)" || exit 0

if [ "${WIDTH:-0}" -gt 1 ] && [ "${HEIGHT:-0}" -gt 1 ]; then
    xdotool mousemove --window "$win_id" "$((WIDTH / 2))" "$((HEIGHT / 2))"
fi
