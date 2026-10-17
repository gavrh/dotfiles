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
