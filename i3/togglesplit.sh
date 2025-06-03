#!/bin/bash

focused=$(i3-msg -t get_tree | jq '.. | objects | select(.focused==true).id')

# focus parent and toggle layout
i3-msg 'focus parent; layout toggle split'

# refocus original window
[ -n "$focused" ] && i3-msg "[con_id=$focused]" focus
