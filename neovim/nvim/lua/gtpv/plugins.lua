-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		-- or                            , branch = '0.1.x',
		dependencies = {
			{'nvim-lua/plenary.nvim'},
		}
	},
	'nvim-treesitter/nvim-treesitter',
	'nvim-treesitter/playground',
	'theprimeagen/harpoon',
	'mbbill/undotree',
	{
		"mcchrish/zenbones.nvim",
		dependencies = "rktjmp/lush.nvim"
	},

	'RRethy/nvim-base16',

	'daschw/leaf.nvim',
	'nyoom-engineering/oxocarbon.nvim',
	'savq/melange-nvim',
	'rose-pine/neovim',


	'ojroques/nvim-hardline',

	'github/copilot.vim',

	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		dependencies = {
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
	},
	{
		"vhyrro/luarocks.nvim",
		priority = 1000,
		config = true,
	}
}

local opts = {
	rocks = {
		enabled = false,
	},
}

require('lazy').setup(plugins, opts)
