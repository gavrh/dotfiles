#!/usr/bin/env python3

import i3ipc
def autosplit(i3, e):
    tree = i3.get_tree()
    focused = tree.find_focused()
    if not focused or not focused.parent:
        return

    if focused.parent.layout in ['tabbed', 'stacked']:
        return

    rect = focused.parent.rect

    if rect.height <= rect.width:
        i3.command('split horizontal')
    else:
        i3.command('split vertical')

i3 = i3ipc.Connection()

i3.on("window::focus", autosplit)
i3.on("window::new", autosplit)
i3.on("window::move", autosplit)

i3.main()
