if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
        export __NV_PRIME_RENDER_OFFLOAD=1 
        export __GLX_VENDOR_LIBRARY_NAM=nvidia
        exec startx
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
