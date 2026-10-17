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

----------------------
---- LOOK & FEEL ----
----------------------

hl.config({
    general = {
        gaps_in = 0,
        gaps_out = 0,
        border_size = 3,
        col = {
            active_border = "rgb(252933)",
            inactive_border = "rgb(1c1f26)",
        },
        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle",
    },

    decoration = {
        rounding = 0,
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        shadow = {
            enabled = false,
        },
        blur = {
            enabled = false,
        },
    },

    animations = {
        enabled = true,
    },

    dwindle = {
        preserve_split = true,
        force_split = 2,
    },

    input = {
        kb_layout = "us",
        follow_mouse = 1,
        sensitivity = 0,
    },

    cursor = {
        no_warps = false,
        warp_on_change_workspace = 0,
    },

    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        force_default_wallpaper = -1,
    },

    ecosystem = {
        no_update_news = true,
    },
})

hl.curve("minimal", { type = "bezier", points = { {0.25, 0.1}, {0.25, 1.0} } })

local animationSpeed = 2

hl.animation({ leaf = "global", enabled = true, speed = animationSpeed, bezier = "minimal" })
hl.animation({ leaf = "windows", enabled = true, speed = animationSpeed, bezier = "minimal" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = animationSpeed, bezier = "minimal", style = "popin 95%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = animationSpeed, bezier = "minimal", style = "popin 95%" })
hl.animation({ leaf = "fade", enabled = true, speed = animationSpeed, bezier = "minimal" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = animationSpeed, bezier = "minimal" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = animationSpeed, bezier = "minimal" })
hl.animation({ leaf = "workspaces", enabled = true, speed = animationSpeed, bezier = "minimal", style = "fade" })
hl.animation({ leaf = "layers", enabled = true, speed = animationSpeed, bezier = "minimal" })
hl.animation({ leaf = "layersIn", enabled = true, speed = animationSpeed, bezier = "minimal", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = animationSpeed, bezier = "minimal", style = "fade" })
