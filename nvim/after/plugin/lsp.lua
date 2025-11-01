-- NOTE: to make any of this work you need a language server.
-- If you don't know what that is, watch this 5 min video:
-- https://www.youtube.com/watch?v=LaS32vctfOY

-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local default_capabilities = vim.lsp.protocol.make_client_capabilities()

vim.lsp.config = vim.lsp.config or {}
vim.lsp.config._defaults = vim.lsp.config._defaults or {}

vim.lsp.config._defaults.capabilities = vim.tbl_deep_extend(
    'force',
    default_capabilities,
    require('cmp_nvim_lsp').default_capabilities()
)


-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = {buffer = event.buf}

        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
        vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
        vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    end,
})

-- common capabilities
local capabilities = vim.tbl_deep_extend(
  'force',
  vim.lsp.protocol.make_client_capabilities(),
  require('cmp_nvim_lsp').default_capabilities()
)

-- lua
vim.lsp.config.lua_ls = {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = { globals = { 'vim' } },
    },
  },
}
-- rust
vim.lsp.config.rust_analyzer = {
  capabilities = capabilities,
}
-- c / cpp
vim.lsp.config.clangd = {
  capabilities = capabilities,
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
    "--compile-commands-dir=build",
  },
}
-- cmake
vim.lsp.config.cmake = { capabilities = capabilities }
-- go
vim.lsp.config.gopls = { capabilities = capabilities }
-- typescript / javascript
vim.lsp.config.ts_ls = { capabilities = capabilities }
-- zig
vim.lsp.config.zls = { capabilities = capabilities }
-- haskell
vim.lsp.config.hls = { capabilities = capabilities }
-- html
vim.lsp.config.html = { capabilities = capabilities }
-- css
vim.lsp.config.cssls = { capabilities = capabilities }
-- react / emmet
vim.lsp.config.emmet_ls = { capabilities = capabilities }
-- tailwind
vim.lsp.config.tailwindcss = {
  capabilities = capabilities,
  filetypes = {
    "html",
    "css",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "jsx",
    "tsx",
  },
}
-- java
vim.lsp.config.jdtls = { capabilities = capabilities }
-- python
vim.lsp.config.pylsp = {
  capabilities = capabilities,
  settings = {
    pylsp = {
      plugins = {
        black = { enabled = true },
        autopep8 = { enabled = false },
        yapf = { enabled = false },
        pylint = { enabled = true, executable = "pylint" },
        pyflakes = { enabled = false },
        pycodestyle = { enabled = false },
        pylsp_mypy = { enabled = true },
        jedi_completion = { fuzzy = true },
        pyls_isort = { enabled = true },
      },
    },
  },
  flags = {
    debounce_text_changes = 200,
  },
}
-- assembly
vim.lsp.config.asm_lsp = {
  capabilities = capabilities,
  root_dir = vim.fs.root(0, { ".git", "." }),
}

local cmp = require('cmp')
cmp.setup({
    sources = {
        {name = 'nvim_lsp'},
    },
    snippet = {
        expand = function(args)
            -- You need Neovim v0.10 to use vim.snippet
            vim.snippet.expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({}),
})

-- autopairs ("", '', {}, [], ())
require('nvim-autopairs').setup({
    disable_filetype = { "TelescopePrompt", "spectre_panel" },
    disable_in_macro = true, -- disable when recording or executing a macro
    disable_in_visualblock = false, -- disable when insert after visual block mode
    disable_in_replace_mode = true,
    -- ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
    enable_moveright = true,
    enable_afterquote = true,  -- add bracket pairs after quote
    enable_check_bracket_line = true,  --- check bracket in same line
    enable_bracket_in_quote = true,
    enable_abbr = false, -- trigger abbreviation
    break_undo = true, -- switch for basic rule break undo sequence
    check_ts = false,
    map_cr = true,
    map_bs = true, -- map the <BS> key
    map_c_h = false,  -- Map the <C-h> key to delete a pair
    map_c_w = false, -- map <c-w> to delete a pair if possible
})

-- autotag (<div></div>)
require('nvim-ts-autotag').setup({
    opts = {
        -- defaults
        enable_close = true,
        enable_rename = true,
        enable_close_on_slash = false
    }
})

-- rust server cancellation fix
for _, method in ipairs({ 'textDocument/diagnostic', 'workspace/diagnostic' }) do
    local default_diagnostic_handler = vim.lsp.handlers[method]
    vim.lsp.handlers[method] = function(err, result, context, config)
        if err ~= nil then
            if err.code == -32802 then
                return
            elseif err.code == -32603 then
                return
            elseif err.code == -32802 then
                return
            end
        end
        return default_diagnostic_handler(err, result, context, config)
    end
end
