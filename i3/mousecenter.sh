#!/bin/bash

# get the currently focused window (X11 window id)
win_id=$(i3-msg -t get_tree | jq '.. | objects | select(.focused==true and has("window") and .window != null) | .window')

if [ -n "$win_id" ]; then
    # get window geometry
    eval "$(xdotool getwindowgeometry --shell "$win_id" 2>/dev/null)"
    # move mouse to center of the window
    xdotool mousemove --window "$win_id" $((WIDTH / 2)) $((HEIGHT / 2))
fi
