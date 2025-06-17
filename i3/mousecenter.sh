#!/bin/bash

win_id=$(xdotool getwindowfocus)
root_id=$(xprop -root _NET_SUPPORTING_WM_CHECK | awk '{print $5}')

if [ -z "$win_id" ] || [ "$win_id" = "0" ] || [ "$win_id" = "$root_id" ]; then
    exit 0
fi

if eval "$(xdotool getwindowgeometry --shell "$win_id" 2>/dev/null)"; then
    if [ "$WIDTH" -gt 1 ] && [ "$HEIGHT" -gt 1 ]; then
        xdotool mousemove --window "$win_id" $((WIDTH / 2)) $((HEIGHT / 2))
    fi
fi

