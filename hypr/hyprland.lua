-- Hyprland config file

------------------
---- PROGRAMS ----
------------------

local terminal    = "kitty"
local browser     = "qutebrowser"
local fileManager = "qtfm"
local menu        = "rofi -show drun"

------------------
---- MONITORS ----
------------------

hl.monitor({
    output = "HDMI-A-1",
    mode = "1920x1080@60",
    position = "0x0",
    scale = 1,
    transform = 1,
})

hl.monitor({
    output = "DP-3",
    mode = "1920x1080@240",
    position = "1080x325",
    scale = 1,
})

hl.monitor({
    output = "HDMI-A-2",
    mode = "2560x1440@75",
    position = "3000x50",
    scale = 1,
})

-- Fallback for any output not listed above.
hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = 1,
})

---------------------------
---- WORKSPACE OUTPUTS ----
---------------------------

local workspaceOutputs = {
    [1] = "HDMI-A-1",
    [2] = "DP-3",
    [3] = "HDMI-A-2",
    [4] = "HDMI-A-1",
    [5] = "DP-3",
    [6] = "HDMI-A-2",
    [7] = "HDMI-A-1",
    [8] = "DP-3",
    [9] = "HDMI-A-2",
}

for workspace, output in pairs(workspaceOutputs) do
    hl.workspace_rule({
        workspace = tostring(workspace),
        monitor = output,
    })
end

---------------------
---- ENVIRONMENT ----
---------------------

hl.env("XCURSOR_THEME", "Adwaita")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("GDK_BACKEND", "wayland,x11")
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("systemctl --user start xdg-desktop-portal-hyprland")
    hl.exec_cmd("systemctl --user restart xdg-desktop-portal")
    hl.exec_cmd("waybar")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("hyprlock")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("gnome-keyring-daemon --start --components=secrets")
end)
