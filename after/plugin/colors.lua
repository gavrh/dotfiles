local hl = vim.api.nvim_set_hl;

function ColorMyPencils(color)
	color = color or 'substrata'
	vim.cmd.colorscheme(color)

	-- native
	hl(0, "Normal", { bg = "none" })
	hl(0, "NormalFloat", { bg = "none" })
	hl(0, "SignColumn", { bg = "none" })
	hl(0, "StatusLine", { bg = "#1f2129" })
    hl(0, "CursorLine", { bg = "#ffffff" }) -- not working for some reason ?

    -- telescope
    hl(0, "TelescopePromptNormal", { bg = "#1f2129" })
    hl(0, "TelescopeResultsNormal", { bg = "#1f2129" })
    hl(0, "TelescopeResultsBorder", { bg = "none" })
    hl(0, "TelescopePreviewNormal", { bg = "#1f2129" })

end

ColorMyPencils()
