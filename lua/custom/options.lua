local o = vim.o

vim.opt.guicursor = ""

o.number = true
o.relativenumber = true
o.numberwidth = 2
o.ruler = false

o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
o.expandtab = true
o.smartindent = true
o.wrap = false

o.clipboard = "unnamedplus"
o.cursorline = true
o.cursorlineopt = "number"

o.swapfile = false
o.backup = false
o.undodir = os.getenv("HOME") .. "/.vim/undodir"
o.undofile = true

o.hlsearch = false
o.incsearch = true

o.termguicolors = true
o.scrolloff = 8
o.signcolumn = "yes"

o.updatetime = 50

vim.g.mapleader = " "
