-- easier commands
vim.keymap.set("n", ";", ":")
-- view error/warning diagnostics
vim.keymap.set("n", "<C-K>", vim.diagnostic.open_float)
-- open file explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- reload current file from disk
vim.keymap.set("n", "<leader>r", "<cmd>edit!<cr>")
-- netrw
vim.keymap.set("n", "<leader>b", function()
    vim.g.netrw_banner = 1 - vim.g.netrw_banner
    vim.cmd("Rex")
end, { desc = "Toggle netrw banner" })
vim.api.nvim_create_autocmd("FileType", {
    pattern = "netrw",
    callback = function(args)
        vim.schedule(function()
            vim.keymap.set("n", "i", "<Nop>", {
                buffer = args.buf,
                silent = true,
            })
        end)
    end,
})
-- move line up or down
vim.keymap.set('n', '<leader>j', 'ddp')
vim.keymap.set('n', '<leader>k', function()
    local current_line = vim.fn.line('.')
    local total_lines = vim.fn.line('$')

    -- handle last line case
    if current_line == total_lines then
        vim.cmd("normal! ddP")
    else
        vim.cmd("normal! ddkP")
    end
end)
-- quick start/end line movement
vim.keymap.set({ "n", "v" }, "H", "0")
vim.keymap.set({ "n", "v" }, "L", "$")
-- stop ctrl-c interrupt
vim.keymap.set({ "i", "v" }, '<C-c>', '<Esc>', { noremap = true })
-- opencode
vim.keymap.set("n", "<leader>ai", function()
    require("opencode.api").toggle()
end, { desc = "Toggle OpenCode" })
vim.keymap.set("n", "<leader>ot", function()
    require("opencode.api").toggle_focus()
end, { desc = "Toggle OpenCode focus" })
