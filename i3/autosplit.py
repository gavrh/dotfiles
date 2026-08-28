#!/usr/bin/env python3

import i3ipc


def autosplit(connection, event):
    focused = connection.get_tree().find_focused()
    if not focused or focused.type != 'con':
        return

    if focused.floating in ('user_on', 'auto_on'):
        return

    parent = focused.parent
    if not parent or parent.layout in ['tabbed', 'stacked']:
        return

    rect = focused.rect
    direction = 'horizontal' if rect.width >= rect.height else 'vertical'
    connection.command(f'[con_id={focused.id}] split {direction}')

i3 = i3ipc.Connection()

i3.on("window::new", autosplit)
i3.main()
