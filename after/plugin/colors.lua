function ColorMyPencils(color)
	color = color or 'substrata'
	vim.cmd.colorscheme(color)

	-- native
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#ffffff", fg = "#000000" })
	vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
	vim.api.nvim_set_hl(0, "StatusLine", { bg = "#1f2129" })
	vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1f2129" })

    -- telescope
    vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "#1f2129" })
    vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "#1f2129" })
    vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "#1f2129" })

end

ColorMyPencils()
