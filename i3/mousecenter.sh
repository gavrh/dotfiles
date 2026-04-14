#!/bin/bash

win_id=$(xdotool getwindowfocus)
root_id=$(xprop -root _NET_SUPPORTING_WM_CHECK | awk '{print $5}')

if [ -z "$win_id" ] || [ "$win_id" == "0" ] || [ "$win_id" == "$root_id" ]; then
    exit 0
fi

geometry=$(xdotool getwindowgeometry "$win_id" 2>/dev/null)
if [ -n "$geometry" ]; then
    WIDTH=$(echo "$geometry" | grep -oP 'Width: \K\d+')
    HEIGHT=$(echo "$geometry" | grep -oP 'Height: \K\d+')

    if [ -n "$WIDTH" ] && [ -n "$HEIGHT" ] && [ "$WIDTH" -gt 1 ] && [ "$HEIGHT" -gt 1 ]; then
        xdotool mousemove --window "$win_id" $((WIDTH / 2)) $((HEIGHT / 2))
    fi
else
    echo "Failed to get geometry for window $win_id"
    exit 1
fi

