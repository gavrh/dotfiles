local ok, copilot = pcall(require, "copilot")
if not ok then return end

copilot.setup({
    suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
            accept = "<M-l>",   -- Alt + l
            -- next   = "<M-.>",   -- Alt + j
            -- prev   = "<M-,>",   -- Alt + k
            dismiss= "<M-d>",   -- Alt + d
        },
    },
    panel = { enabled = false },
})

-- nvim-cmp integration
pcall(function()
    require("copilot_cmp").setup()
end)
