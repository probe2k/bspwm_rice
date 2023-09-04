local default_plugins = {
	'nvim-tree/nvim-web-devicons',

	{
		'catppuccin/nvim', name = 'catppuccin',
		-- event = { 'UIEnter' },
		init = function() require('core.utils').lazy_load 'catppuccin'
		end,
--		opts = function() return require 'plugins.configs.colorscheme'
--		end,
		config = function()
			return require 'plugins.configs.colorscheme'
		end,
	},

	{
		'lukas-reineke/indent-blankline.nvim',
		event = { 'BufReadPost', 'BufNewFile' },
--		init = function()
--			require('core.utils').lazy_load 'indent-blankline.nvim'
--		end,
		opts = function() return require 'plugins.configs.blankline'
		end,
		config = function(_, opts)
			require('indent_blankline').setup(opts)
		end,
	},

	{
		'nvim-treesitter/nvim-treesitter',
		event = { 'BufReadPost', 'BufNewFile' },
--		init = function()
--			require('core.utils').lazy_load 'nvim-treesitter'
--		end,
		cmd = { 'TSInstall', 'TSBufEnable', 'TSBufDisable', 'TSModuleInfo' },
		build = ':TSUpdate',
		opts = function()
			return require 'plugins.configs.treesitter' end,
		config = function(_, opts)
			require('nvim-treesitter.configs').setup(opts)
		end,
	},

	{
		'lewis6991/gitsigns.nvim',
		ft = { 'gitcommit', 'diff' },
		init = function()
			vim.api.nvim_create_autocmd({ 'BufRead' }, {
				group = vim.api.nvim_create_augroup('GitSignsLazyLoad', { clear = true }),
				callback = function()
					vim.fn.system("git -C " .. '"' .. vim.fn.expand "%:p:h" .. '"' .. " rev-parse")
					if vim.v.shell_error == 0 then
						vim.api.nvim_del_augroup_by_name 'GitSignsLazyLoad'
						vim.schedule(function()
							require('lazy').load { plugins = { 'gitsigns.nvim' } }
						end)
					end
				end,
			})
		end,
		opts = function()
			return require 'plugins.configs.gitsigns'
		end,
		config = function()
			require('gitsigns').setup(opts)
		end,
	},

	{
		'williamboman/mason.nvim',
		cmd = { 'Mason', 'MasonInstall', 'MasonInstallAll', 'MasonUninstall', 'MasonUninstallAll', 'MasonLog' },
		opts = function()
			return require 'plugins.configs.mason'
		end,
		config = function(_, opts)
			require('mason').setup(opts)
			vim.api.nvim_create_user_command('MasonInstallAll', function()
				vim.cmd('MasonInstall ' .. table.concat(opts.ensure_installed, ' '))
			end, {})

			vim.g.mason_binaries_list = opts.ensure_installed
		end,
	},

	{
		'neovim/nvim-lspconfig',
		event = { 'BufReadPost', 'BufNewFile' },
--		init = function()
--			require('core.utils').lazy_load 'nvim-lspconfig'
--		end,
		dependencies = {
			{
				'glepnir/lspsaga.nvim',
				branch = 'main',
				dependencies = 'onsails/lspkind.nvim',
				opts = function()
					return require('plugins.configs.lspsaga')
				end,
				config = function(_, opts)
					require('lspsaga').setup(opts)
				end,
			},
		},
		config = function()
			require 'plugins.configs.lspconfig'
		end,
	},

	{
		'hrsh7th/nvim-cmp',
		event = 'InsertEnter',
		dependencies = {
			{
				'L3MON4D3/LuaSnip',
				dependencies = 'rafamadriz/friendly-snippets',
			},

			{
				'windwp/nvim-autopairs',
				opts = {
					fast_wrap = {},
					disable_filetype = { 'TelescopePrompt', 'vim' },
				},
				config = function(_, opts)
					require('nvim-autopairs').setup(opts)

					local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
					require('cmp').event:on('confirm_done', cmp_autopairs.on_confirm_done())
				end,
			},

			{
				'saadparwaiz1/cmp_luasnip',
				'hrsh7th/cmp-nvim-lsp',
				'hrsh7th/cmp-buffer',
				'hrsh7th/cmp-path',
			},
		},
		opts = function()
			return require 'plugins.configs.cmp'
		end,
		config = function(_, opts)
			require('cmp').setup(opts)
		end,
	},

	{
		'nvim-tree/nvim-tree.lua',
		cmd = { 'NvimTreeToggle', 'NvimTreeFocus' },
		opts = function()
			return require 'plugins.configs.nvimtree'
		end,
		config = function(_, opts)
			require('nvim-tree').setup(opts)
		end,
	},

	{
		'nvim-telescope/telescope.nvim',
		cmd = 'Telescope',
		dependencies = {
			'nvim-lua/plenary.nvim',
		},
		opts = function()
			return require 'plugins.configs.telescope'
		end,
		config = function(_, opts)
			require('telescope').setup(opts)
		end,
	},

	{
		'nvim-lualine/lualine.nvim',
		event = 'VeryLazy',
		opts = function()
			return require 'plugins.configs.lualine'
		end,
		config = function(_, opts)
			require('lualine').setup(opts)
		end
	},

	{
		'akinsho/bufferline.nvim',
		event = 'VeryLazy',
		opts = function()
			return require 'plugins.configs.bufferline'
		end,
		config = function(_, opts)
			require('bufferline').setup(opts)
		end,
	},

	{
		'akinsho/toggleterm.nvim',
		cmd = { 'ToggleTerm', 'ToggleTermAll' },
		opts = function()
			return require 'plugins.configs.terminal'
		end,
		config = function(_, opts)
			require('toggleterm').setup(opts)
		end
	},
}

require('lazy').setup(default_plugins, require 'plugins.configs.lazy_nvim')
