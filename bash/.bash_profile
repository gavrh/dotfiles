if [ -z "$DISPLAY" ] && [ -z "$WAYLAND_DISPLAY" ] && command -v uwsm >/dev/null 2>&1 && uwsm check may-start; then
    exec uwsm start hyprland.desktop
fi

if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
