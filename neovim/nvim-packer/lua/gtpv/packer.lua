-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.2',
	  -- or                            , branch = '0.1.x',
	  requires = {
		  {'nvim-lua/plenary.nvim'},
	  }
  }
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')
  use('theprimeagen/harpoon')
  use('mbbill/undotree')

  use {
	  "mcchrish/zenbones.nvim",
	  requires = "rktjmp/lush.nvim"
  }

  use('RRethy/nvim-base16')

  use('daschw/leaf.nvim')
  use {'nyoom-engineering/oxocarbon.nvim'}
  use {'savq/melange-nvim'}
  use({
	  'rose-pine/neovim',
	  as = 'rose-pine',
--	  config = function()
--		  vim.cmd('colorscheme rose-pine')
--	  end
  })


  use {'ojroques/nvim-hardline'}

  use('github/copilot.vim')

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v2.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion : I'm going to use copilot
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }
end)
