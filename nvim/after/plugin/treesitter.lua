-- A list of parser names to install (nvim-treesitter `main` branch API)
local parsers = {
    "javascript",
    "typescript",
    "tsx",
    "html",
    "css",
    "c",
    "cpp",
    "c_sharp",
    "ocaml",
    "asm",
    "lua",
    "luau",
    "rust",
    "go",
    "zig",
    "haskell",
    "java",
    "python",
    "vim",
    "vimdoc",
    "query",
    "markdown",
    "markdown_inline",
    "diff",
}

require('nvim-treesitter').setup({})
require('nvim-treesitter').install(parsers)

vim.api.nvim_create_autocmd("FileType", {
    callback = function(args)
        if not pcall(vim.treesitter.start, args.buf) then
            return
        end

        local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
        if lang and vim.treesitter.query.get(lang, "indents") then
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "opencode_output",
    callback = function(args)
        vim.treesitter.start(args.buf, "markdown")
    end,
})
