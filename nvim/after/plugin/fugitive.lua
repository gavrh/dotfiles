vim.cmd([[
    cnoreabbrev <expr> git (getcmdtype() ==# ':' && getcmdline() =~# '^\s*git\>') ? 'Git ++curwin' : 'git'
    cnoreabbrev <expr> Git (getcmdtype() ==# ':' && getcmdline() =~# '^\s*Git\>') ? 'Git ++curwin' : 'Git'
]])

vim.keymap.set("n", "<leader>gs", "<cmd>Git ++curwin<cr>")
vim.keymap.set("n", "<leader>df", "<cmd>Git ++curwin diff<cr>")
