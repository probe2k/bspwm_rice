return {
	-- colorscheme
	{
		'folke/tokyonight.nvim',
		init = function()
			require('plugins.configs.colorscheme')
		end,
	},

	-- file explorer
	{
		'nvim-tree/nvim-tree.lua',
		cmd = { 'NvimTreeToggle', 'NvimTreeFocus' },
		init = function()
			require('plugins.configs.nvim-tree').config()
		end,
	},

	-- devicons for bufferline and nvim-tree
	'ryanoasis/vim-devicons',
	'kyazdani42/nvim-web-devicons',

	-- buffer indicator
	{
		'akinsho/bufferline.nvim',
		init = function()
			require('core.utils').lazy_load('bufferline.nvim')
		end,
		config = function()
			require('plugins.configs.bufferline').config()
		end,
	},

	-- status indicator
	{
		'nvim-lualine/lualine.nvim',
		init = function()
			require('core.utils').lazy_load('lualine.nvim')
		end,
		config = function()
			require('plugins.configs.lualine').config()
		end,
	},

	-- auto-completion
	{
		'hrsh7th/nvim-cmp',
		event = 'InsertEnter',
		dependencies = {
			-- snippets for nvim-cmp
			{
				'L3MON4D3/LuaSnip',
				dependencies = 'rafamadriz/friendly-snippets',
			},

			-- configure auto closing
			{
				'windwp/nvim-autopairs',
				init = function()
					require('plugins.configs.autopairs').config()
				end,
			},

			-- cmp sources plugins
			{
				'saadparwaiz1/cmp_luasnip',
				'hrsh7th/cmp-nvim-lsp',
				'hrsh7th/cmp-buffer',
				'hrsh7th/cmp-path',
			},
		},
		config = function()
			require('plugins.configs.nvim-cmp').config()
		end,
	},


	-- managing and installing lsp servers
	{
		'williamboman/mason.nvim',
		cmd = { 'Mason' },
		dependencies = 'williamboman/mason-lspconfig.nvim',
		init = function()
			require('plugins.configs.mason').config()
		end,
	},

	-- add git integrations
	{
		'lewis6991/gitsigns.nvim',
		event = { 'BufRead' },
		init = function()
			require('plugins.configs.gitsigns').config()
		end,
	},

	-- add indent-line
	{
		'lukas-reineke/indent-blankline.nvim',
		init = function()
			require('core.utils').lazy_load 'indent-blankline.nvim'
		end,
		config = function()
			require('plugins.configs.indent-blankline').config()
		end,
	},

	-- configure lsp servers
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			{
				'glepnir/lspsaga.nvim',
				branch = 'main',
				dependencies = 'onsails/lspkind.nvim',
				init = function()
					require('plugins.configs.lspsaga').config()
				end,
			},
		},
		init = function()
			require('core.utils').lazy_load 'nvim-lspconfig'
		end,
		config = function()
			require('plugins.configs.lspconfig').config()
		end,
	},

	-- configure treesitter
	{
		'nvim-treesitter/nvim-treesitter',
		cmd = { 'TSInstall', 'TSBufEnable', 'TSBufDisable', 'TSModuleInfo' },
		build = ':TSUpdate',
		init = function()
			require('core.utils').lazy_load 'nvim-treesitter'
		end,
		config = function()
			require('plugins.configs.treesitter').config()
		end,
	},

	-- setup telescope for browsing files / buffers and more
	{
		'nvim-telescope/telescope.nvim',
		cmd = 'Telescope',
		branch = '0.1.x',
		dependencies = {
			'nvim-lua/plenary.nvim',
		},
		init = function()
			require('core.utils').lazy_load 'telescope.nvim'
		end,
		config = function()
			require('plugins.configs.telescope').config()
		end,
	},

	-- configure terminal inside neovim
	{
		'akinsho/toggleterm.nvim',
		version = '*',
		init = function()
			require('core.utils').lazy_load 'toggleterm.nvim'
		end,
		config = function()
			require('plugins.configs.terminal').config()
		end,
	},
}
