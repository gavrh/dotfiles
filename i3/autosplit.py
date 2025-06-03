#!/usr/bin/env python3

import i3ipc

def on_window_new(i3, e):
    tree = i3.get_tree()
    focused = tree.find_focused()
    if focused.parent.layout in ['tabbed', 'stacked']:
        return
    rect = focused.parent.rect
    if rect.width > rect.height:
        i3.command('split vertical')
    else:
        i3.command('split horizontal')

i3 = i3ipc.Connection()
i3.on("window::new", on_window_new)
i3.main()
