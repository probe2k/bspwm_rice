local conf = require('modules.completion.config')

return function(use)
	use({
		'williamboman/mason.nvim',
		cmd = { 'Mason', 'MasonInstall', 'MasonInstallAll' },
		module = false,
		config = conf.mason,
	})

	use({ 'neovim/nvim-lspconfig', dependencies = { 'glepnir/lspsaga.nvim', branch = 'main', dependencies = 'onsails/lspkind.nvim', lazy = true, module = false, config = conf.lspsaga }, config = conf.nvim_lsp, lazy = true })

	use({
		'hrsh7th/nvim-cmp',
		module = false,
		event = { 'InsertEnter', 'CmdlineEnter' },

		dependencies = {
			{'L3MON4D3/LuaSnip', dependencies = { 'rafamadriz/friendly-snippets', module = false, lazy = true}, lazy = true },
			{ 'hrsh7th/cmp-buffer', lazy = true },
			{ 'hrsh7th/cmp-nvim-lua', lazy = true },
			{ 'hrsh7th/cmp-path', lazy = true },
			{ 'hrsh7th/cmp-cmdline', lazy = true },
			{ 'dmitmel/cmp-cmdline-history', lazy = true },
			{ 'hrsh7th/cmp-emoji', lazy = true },
			{ 'ray-x/cmp-treesitter', dev = (plugin_folder():find('github') ~= nil), lazy = true },
			{ 'saadparwaiz1/cmp_luasnip', lazy = true },
		},

		config = conf.nvim_cmp,
	})

	use({
		'nvim-telescope/telescope.nvim',
		cmd = 'Telescope',
		config = conf.telescope,
		init = conf.telescope_preload,
		dependencies = {
			{ 'nvim-lua/plenary.nvim', lazy = true },
		},
		lazy = true,
	})
end
