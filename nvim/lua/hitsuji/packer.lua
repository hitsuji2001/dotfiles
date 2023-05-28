-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use ('wbthomason/packer.nvim')
    use ('mbbill/undotree')
    use ('nvim-tree/nvim-web-devicons')
    use ('tpope/vim-fugitive')
    use ('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use ({ "catppuccin/nvim", as = "catppuccin" })
    use ({ "ellisonleao/gruvbox.nvim" })
    use ({
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = { {'nvim-lua/plenary.nvim'} }
    })
    use ({
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
        config = function()
            require("nvim-tree").setup {}
        end
    })
    use ({
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    })
end)
