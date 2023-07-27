-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use ('wbthomason/packer.nvim')
  use ('mbbill/undotree')
  use ('nvim-tree/nvim-web-devicons')
  use ('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use ('nvim-treesitter/nvim-treesitter-context')
  use ('tpope/vim-fugitive')
  use ('junegunn/vim-easy-align')
  use ('ellisonleao/gruvbox.nvim')
  use ('Mofiqul/dracula.nvim')
  use ('folke/tokyonight.nvim')
  use ({ 'catppuccin/nvim', as = 'catppuccin' })
  use ({ 'rust-lang/rust.vim', ft = 'rust' })
  use ({
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { 'nvim-lua/plenary.nvim' }
  })
  use ({
    'nvim-tree/nvim-tree.lua',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true},
    config = function() require("nvim-tree").setup {} end
  })
  use ({
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  })
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "folke/trouble.nvim",
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    run = ":MasonUpdate" -- :MasonUpdate updates registry contents
  }
end)

