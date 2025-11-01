-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        -- or				, branch = '0.1.x'
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- colorscheme
    use({
        'gavrh/adderall.nvim',
        as = 'adderall'
    })

    -- treesitter
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('nvim-treesitter/playground')
    use('tpope/vim-fugitive')

    -- lsp
    use({'neovim/nvim-lspconfig'})
    use({'hrsh7th/nvim-cmp'})
    use({'hrsh7th/cmp-nvim-lsp'})
    use({'williamboman/mason.nvim'})
    use({'williamboman/mason-lspconfig.nvim'})

    -- auto syntax
    use({'windwp/nvim-autopairs'})
    use({'windwp/nvim-ts-autotag'})

    -- leetcode
    -- "nvim leetcode.nvim" to run
    use({
        'kawre/leetcode.nvim',
        requires = {
            'nvim-telescope/telescope.nvim',
            'nvim-lua/plenary.nvim',
            'muniftanjim/nui.nvim'
        }
    })

    -- copilot
    use({
        'zbirenbaum/copilot.lua',
        config = function()
            require("copilot").setup({
                suggestion = { enabled = true, auto_trigger = true },
                panel = { enabled = false },
            })
        end,
    })

end)
