# dotfiles
My dotfiles for my arch linux hyprland/wayland setup.

## Installation
```bash
# clone repo
git clone https://github.com/gavrh/dotfiles.git

cd dotfiles

# install stow package
sudo pacman -S stow

# stow all config files
make

# stow specific config(s)
make <config(s)>
```

## Manual Configuration

### Monitors and workspaces

File: `hypr/hyprland.lua`

Find monitor names and modes:

```bash
hyprctl monitors
```

Example:

```lua
hl.monitor({
    output = "DP-1",
    mode = "1920x1080@240",
    position = "0x0",
    scale = 1,
})
```

Update `workspaceOutputs` in the same file to match your monitor names.

### Waybar output

File: `waybar/config.jsonc`

Find monitor names:

```bash
hyprctl monitors
```

Example:

```jsonc
"output": "DP-1",
```

Remove `output` to show the bar on every monitor.

### Lock screen monitor

File: `hypr/hyprlock.conf`

Find monitor names:

```bash
hyprctl monitors
```

Example:

```conf
input-field {
    monitor = DP-1
}
```

Update the clock label monitor as well if it should appear on the same screen.

### Mixed GPU

File: `uwsm/env-hyprland`

Find the DRM devices:

```bash
ls -l /dev/dri/by-path
```

Example:

```bash
export AQ_DRM_DEVICES="/dev/dri/card1:/dev/dri/card0"
```

Remove this line on a single-GPU system.

### Keyboard layout

File: `hypr/hyprland.lua`

Find connected keyboard devices:

```bash
hyprctl devices
```

Example:

```lua
input = {
    kb_layout = "us",
}
```

### Fonts and cursor

Files: `kitty/kitty.conf` and `uwsm/env`

Find installed fonts:

```bash
fc-list
```

Example:

```conf
font_family Hack
```

```bash
export XCURSOR_THEME="Adwaita"
export XCURSOR_SIZE="24"
```

Install the configured font and cursor theme before applying these values.

### LightDM autologin

This repository does not configure LightDM. My setup uses LightDM autologin to start the `hyprland-uwsm` session, which bypasses the LightDM greeter. The `hyprlock` entry in the Hyprland autostart is intentional: it presents the lock screen after autologin, so the desktop is not left unlocked at boot.

To disable the startup lock, remove this line from `hypr/hyprland.lua`:

```lua
hl.exec_cmd("hyprlock")
```

To disable LightDM autologin, remove or edit this file:

```text
/etc/lightdm/lightdm.conf.d/50-autologin.conf
```

Removing `autologin-user` and `autologin-session` restores the normal LightDM greeter.

To set up LightDM autologin, add the user to the `autologin` group:

```bash
sudo groupadd -r autologin
sudo gpasswd -a <USER> autologin
```

Then create `/etc/lightdm/lightdm.conf.d/50-autologin.conf`:

```ini
[Seat:*]
autologin-user=<USER>
autologin-user-timeout=0
autologin-session=hyprland-uwsm
user-session=hyprland-uwsm
```

Enable LightDM:

```bash
sudo systemctl enable lightdm
```
