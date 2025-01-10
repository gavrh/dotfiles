local hl = vim.api.nvim_set_hl;

function ColorMyPencils(color)
	color = color or 'substrata'
	vim.cmd.colorscheme(color)

	-- native
	hl(0, "Normal", { bg = "none" })
	hl(0, "NormalFloat", { bg = "none" })
	hl(0, "SignColumn", { bg = "none" })
	hl(0, "StatusLine", { bg = "#21232b" })
    hl(0, "CursorLine", { bg = "#21232b" })

    -- telescope
    hl(0, "TelescopePromptNormal", { bg = "#21232b" })
    hl(0, "TelescopeResultsNormal", { bg = "#21232b" })
    hl(0, "TelescopeResultsBorder", { bg = "none" })
    hl(0, "TelescopePreviewNormal", { bg = "#21232b" })

end

ColorMyPencils()
