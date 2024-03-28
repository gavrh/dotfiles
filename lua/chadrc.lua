-- This file  needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local overrides = require "custom.plugins.override"
local M = {}

M.ui = {
	theme = "everforest",

	hl_override = {
	  Comment = { italic = true },
	  ["@comment"] = { italic = true },
    Normal = {
        bg = {"black", -5}
    },
    Pmenu = { bg = "white" },
	},
}

M.chad = {
  plugin="true",
  i = {
    ["<Cr>"] = { "<ESC>", "escape insert mode" },
  }
}

--M.mappings = require "custom.mappings"

M.treesitter = {
  autoinstall = true,
}


return M
