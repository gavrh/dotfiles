local hl = vim.api.nvim_set_hl;

function ColorMyPencils(color)

	color = color or 'adderall'
	vim.cmd.colorscheme(color)

	-- native
    hl(0, "Normal", { bg = "none" })

end

ColorMyPencils()
