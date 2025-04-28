-- view error/warning diagnostics
vim.keymap.set("n", "<C-K>", vim.diagnostic.open_float)
-- open file explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- easier commands
vim.keymap.set("n", ";", ":")
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
-- toggle netrw banner
vim.keymap.set("n", "<leader>b", function()
    vim.g.netrw_banner = 1 - vim.g.netrw_banner
    vim.cmd("Rex")
end, { desc = "Toggle netrw banner" })
