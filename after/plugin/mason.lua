require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "clangd",
        "gopls",
        "ts_ls",
        "zls",
        "html",
        "htmx",
        "cssls",
        "emmet_ls",
        "tailwindcss",
        "pylsp",
    },
})
