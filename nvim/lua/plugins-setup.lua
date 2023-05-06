local vim = vim

local M = {}

function M.setup()
	-- Autocommand to reload nvim when this config is saved
	vim.cmd([[
		augroup packer_user_config
			autocmd!
			autocmd BufWritePost plugins.lua source <afile> | PackerCompile
		augroup end
	]])

	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		Packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[ packadd packer.nvim ]]
	end

	require('packer').startup(function(use)
		-- Setup default packer install
		use("wbthomason/packer.nvim")

		-- Colorscheme tokyonight
		use {"folke/tokyonight.nvim", config = "require('core.colorscheme').config()"}

		-- Managing and installing lsp servers
		use("williamboman/mason.nvim")
		use("williamboman/mason-lspconfig.nvim")

		-- Configure treesitter
		use {
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			event = "BufWinEnter",
			config = "require('plugins.treesitter').config()"
		}

		-- Icons for NERDTree and Bufferline
		use("ryanoasis/vim-devicons")
		use("kyazdani42/nvim-web-devicons")

		-- Statusline
		use {"nvim-lualine/lualine.nvim", event = "BufWinEnter", config = "require('plugins.lualine').config()"}

		-- Buffer indicator
		use {'akinsho/bufferline.nvim', event = "BufWinEnter", config = "require('plugins.bufferline').config()"}

		-- File explorer
		use {
			"nvim-tree/nvim-tree.lua",
			tag = "nightly",
			cmd = "NvimTreeToggle",
			config = "require('plugins.nvim-tree').config()"
		}

		-- Configure lsp servers
		use {"neovim/nvim-lspconfig"}
		use {"hrsh7th/cmp-nvim-lsp"}
		use { "glepnir/lspsaga.nvim", branch = "main"}
		use {"onsails/lspkind.nvim"}

		-- Auto-completion
		use {"hrsh7th/nvim-cmp"}
		use {"hrsh7th/cmp-buffer"}
		use {"hrsh7th/cmp-path"}

		-- Snippets
		use {"L3MON4D3/LuaSnip"}
		use {"saadparwaiz1/cmp_luasnip"}
		use {"rafamadriz/friendly-snippets"}

		-- Configure auto closing
		use {"windwp/nvim-autopairs"}

		-- Setup telescope
		use { "nvim-telescope/telescope-fzf-native.nvim", run = "make", config = "require('plugins.telescope').config()" }
		use({ "nvim-telescope/telescope.nvim", branch = "0.1.x", requires = { {'nvim-lua/plenary.nvim'} } })

		-- Add git integrations
		use {"lewis6991/gitsigns.nvim", config = "require('plugins.gitsigns').config()"}

		-- Add indent-line
		use {"lukas-reineke/indent-blankline.nvim", event = "BufRead", config = "require('plugins.indent-blankline').config()"}

		-- Configure terminal inside neovim
		use {
			'akinsho/toggleterm.nvim',
			tag = "*",
			config = "require('plugins.terminal').config()"
		}

		if Packer_bootstrap then
			require('packer').sync()
		end
	end)
end

return M
