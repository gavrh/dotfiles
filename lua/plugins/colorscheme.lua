local palette = {
    white = "#E3E3E3",
    gray_light = "#E0DEF4",
    gray = "#A7A5B5",
    gray_dark = "#423F57",
    green_dark = "#797D79",
    purple_dark = "#756D9E",
    red_dark = "#885a8c",
    red_light = "#EB6F92",
    blue_dark = "#31748F",
    blue = "#5EA4BF",
}

if true then
    return {
        -- add colorscheme
        {
            "rose-pine/neovim",
            name = "rose-pine",
            priority = 1000,
            config = function()
                require("rose-pine").setup({
                    -- colorscheme config
                    variant = "auto",
                    dark_variant = "main",
                    dim_inactive_windows = false,
                    extend_background_behind_borders = true,

                    enable = {
                        terminal = true,
                        lagacy_highlights = true,
                        migrations = true,
                    },
                    styles = {
                        bold = true,
                        italic = false,
                        transparency = false,
                    },
                    groups = {
                        border = "muted",
                        link = "iris",
                        panel = "surface",

                        error = "love",
                        hint = "iris",
                        info = "foam",
                        note = "pine",
                        todo = "rose",
                        warn = "gold",

                        h1 = "iris",
                        h2 = palette.purple_dark,
                        h3 = "rose",
                        h4 = palette.green_dark,
                        h5 = "pine",
                        h6 = "foam",
                    },
                    highlight_groups = {
                        ["@variable"] = { fg = palette.white },
                        ["@variable.builtin"] = { fg = palette.white },
                        ["@variable.parameter"] = { fg = palette.white },
                        --["@variable.parameter.builtin"] = {},
                        ["@variable.member"] = { fg = palette.gray },

                        ["@constant"] = { fg = palette.green_dark },
                        ["@constant.builtin"] = { fg = palette.green_dark },
                        --["@constant.macro"] = {},

                        ["@module"] = { fg = palette.green_dark },
                        ["@module.builtin"] = { fg = palette.green_dark },
                        ["@label"] = { fg = palette.green_dark },

                        ["@lsp.type.string"] = { fg = palette.blue_dark },
                        ["@string"] = { fg = palette.blue_dark },
                        --["@string.documentation"] = {},
                        --["@string.regexp"] = {},
                        --["@string.escape"] = {},
                        --["@string.special"] = {},
                        --["@string.special.symbol"] = {},
                        --["@string.special.path"] = {},
                        --["@string.special.url"] = {},

                        --["@character"] = {},
                        --["@character.special"] = {},

                        ["@boolean"] = { fg = palette.blue },
                        ["@number"] = { fg = palette.blue },
                        ["@number.float"] = { fg = palette.blue },

                        ["@type"] = { fg = palette.green_dark },
                        ["@type.builtin"] = { fg = palette.green_dark },
                        --["@type.defenition"] = {},

                        ["@function"] = { fg = palette.red_dark },
                        ["@function.builtin"] = { fg = palette.red_dark },
                        ["@function.call"] = { fg = palette.red_dark },
                        ["@function.macro"] = { fg = palette.red_dark },
                        ["@function.method"] = { fg = palette.red_dark },
                        ["@function.method.call"] = { fg = palette.red_dark },

                        --["@constructor"]
                        ["@operator"] = { fg = palette.purple_dark },

                        ["@keyword"] = { fg = palette.purple_dark },
                        ["@keyword.coroutine"] = { fg = palette.purple_dark },
                        ["@keyword.operator"] = { fg = palette.purple_dark },
                        ["@keyword.import"] = { fg = palette.purple_dark },
                        ["@keyword.type"] = { fg = palette.purple_dark },
                        ["@keyword.modifier"] = { fg = palette.purple_dark },
                        ["@keyword.repeat"] = { fg = palette.purple_dark },
                        ["@keyword.return"] = { fg = palette.purple_dark },
                        ["@keyword.debug"] = { fg = palette.purple_dark },
                        ["@keyword.exception"] = { fg = palette.purple_dark },
                        ["@keyword.conditional"] = { fg = palette.purple_dark },
                        ["@keyword.conditional.ternary"] = { fg = palette.purple_dark },

                        ["@punctuation.delimiter"] = { fg = palette.purple_dark },
                        ["@punctuation.bracket"] = { fg = palette.purple_dark },
                        ["@punctuation.special"] = { fg = palette.purple_dark },

                        ["@comment"] = { fg = palette.gray_dark },
                        ["@comment.documentation"] = { fg = palette.gray_dark },

                        ["@lsp.type.class"] = { fg = palette.green_dark },
                        ["@lsp.type.decorator"] = { fg = palette.red_dark },
                        ["@lsp.type.enumMember"] = { fg = palette.green_dark },
                        ["@lsp.type.formatSpecifier"] = { fg = palette.purple_dark },
                        ["@lsp.type.function"] = { fg = palette.red_dark },
                        ["@lsp.type.interface"] = { fg = palette.green_dark },
                        ["@lsp.type.macro"] = { fg = palette.red_dark },
                        ["@lsp.type.method"] = { fg = palette.red_dark },
                        ["@lsp.type.modifier"] = { fg = palette.purple_dark },
                        ["@lsp.type.namespace"] = { fg = palette.green_dark },
                        ["@lsp.type.operator"] = { fg = palette.purple_dark },
                        ["@lsp.type.parameter"] = { fg = palette.white },
                        ["@lsp.type.property"] = { fg = palette.gray },
                        ["@lsp.type.selfKeyword"] = { fg = palette.white },
                        ["@lsp.type.struct"] = { fg = palette.green_dark },
                        ["@lsp.type.variable"] = { fg = palette.white },
                    },
                })
            end,
        },

        {
            "LazyVim",
            opts = {
                colorscheme = "rose-pine",
            },
        },
    }
end
