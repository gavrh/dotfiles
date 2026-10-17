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

--------------------
---- WINDOW RULES ----
--------------------

hl.window_rule({
    name = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

---------------------
---- KEYBINDINGS ----
---------------------
local mod      = "SUPER"
local modShift = mod .. " + SHIFT"
local modAlt   = mod .. " + ALT"

-- Launch programs
hl.bind(mod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mod .. " + b", hl.dsp.exec_cmd(browser))
hl.bind(mod .. " + d", hl.dsp.exec_cmd(menu))
hl.bind(mod .. " + e", hl.dsp.exec_cmd(fileManager))

-- Window management
hl.bind(mod .. " + c", hl.dsp.window.close())
hl.bind(mod .. " + f", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mod .. " + space", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod .. " + x", hl.dsp.layout("togglesplit"))
hl.bind(mod .. " + w", hl.dsp.layout("togglesplit"))

-- Manual splits
hl.bind(mod .. " + CTRL + h", hl.dsp.layout("preselect r"))
hl.bind(mod .. " + CTRL + v", hl.dsp.layout("preselect d"))

-- Focus
hl.bind(mod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + j", hl.dsp.focus({ direction = "down" }))
hl.bind(mod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + l", hl.dsp.focus({ direction = "right" }))

-- Move windows
hl.bind(modAlt .. " + h", hl.dsp.window.move({ direction = "left" }))
hl.bind(modAlt .. " + j", hl.dsp.window.move({ direction = "down" }))
hl.bind(modAlt .. " + k", hl.dsp.window.move({ direction = "up" }))
hl.bind(modAlt .. " + l", hl.dsp.window.move({ direction = "right" }))

-- Workspaces
for workspace = 1, 10 do
    local key = workspace % 10
    hl.bind(mod .. " + " .. key, hl.dsp.focus({ workspace = workspace }))
    hl.bind(modShift .. " + " .. key, hl.dsp.window.move({ workspace = workspace, follow = false }))
end

-- Mouse move/resize
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Reload and exit
hl.bind(modShift .. " + c", hl.dsp.exec_cmd("hyprctl reload"))
hl.bind(modShift .. " + r", hl.dsp.exec_cmd("hyprctl reload"))
hl.bind(modShift .. " + e", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit"))

-- Media keys
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +10%"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -10%"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("pactl set-source-mute @DEFAULT_SOURCE@ toggle"), { locked = true, repeating = true })

-- Resize mode
hl.bind(mod .. " + r", hl.dsp.submap("resize"))

hl.define_submap("resize", function()
    hl.bind("j", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
    hl.bind("k", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })
    hl.bind("l", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
    hl.bind("semicolon", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })

    hl.bind("left", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
    hl.bind("down", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })
    hl.bind("up", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
    hl.bind("right", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })

    hl.bind("Return", hl.dsp.submap("reset"))
    hl.bind("Escape", hl.dsp.submap("reset"))
    hl.bind(mod .. " + r", hl.dsp.submap("reset"))
end)
