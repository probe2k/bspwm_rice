local vim = vim

local M = {}

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diff = {
	"diff",
	colored = true,
	symbols = {
		added = " ",
		modified = " ",
		removed = " ",
	},
	color = { bg = "#242735" },
	separator = { left = "", right = "" },
}

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = {
		"info",
		"error",
		"warn",
		"hint",
	},
	symbols = {
		error = " ",
		warn = " ",
		hint = " ",
		info = " ",
	},
	colored = true,
	always_visible = false,
}

local filetype = {
	"filetype",
	icons_enabled = true,
}

local location = {
	"location",
	padding = 0,
}

local vim_icons = {
	function()
		return ""
	end,
	separator = { left = "" },
}

local modes = {
	"mode",
	separator = { left = "", right = "" },
}

local branch = {
	"branch",
	icon = "",
	color = { bg = "#242735", fg = "#c296eb" },
	separator = { left = "", right = "" },
}

function M.setup()
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
		use { 'wbthomason/packer.nvim' }
		use 'nvim-lualine/lualine.nvim'
		use 'lewis6991/impatient.nvim'
		use 'kyazdani42/nvim-web-devicons'
		use 'akinsho/bufferline.nvim'
		use 'ap/vim-css-color'
		use 'tpope/vim-fugitive'
		use ('plasticboy/vim-markdown', {['for'] = 'markdown'})
		use 'ryanoasis/vim-devicons'
		use 'preservim/nerdtree'
		use 'folke/tokyonight.nvim'

		require('lualine').setup {
			options = {
				globalstatus = true,
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = { "alpha", "dashboard" },
				always_divide_middle = true,
			},
			sections = {
				lualine_a = {
					vim_icons,
					modes,
				},
				lualine_b = {},
				lualine_c = {
					{
						"filetype",
						icon_only = true,
						colored = true,
					},
					{
						"filename",
					},
					branch,
					diff,
					{
						function()
							return ""
						end,
						color = { bg = "#8FCDA9", fg = "#121319" },
						separator = { left = "", right = "" },
					},
					diagnostics,
				},
				lualine_x = {
					{
						function()
							return ""
						end,
						separator = { left = "", right = "" },
						color = { bg = "#C296EB", fg = "#000000" },
					},
					"progress",
					{
						function()
							return ""
						end,
						separator = { left = "", right = "" },
						color = { bg = "#ECD3A0", fg = "#000000" },
					},
					{
						"location",
					},
					{
						function()
							return ""
						end,
						separator = { left = "", right = "" },
						color = { bg = "#86AAEC", fg = "#000000" },
					},
				},
				lualine_y = {},
				lualine_z = {},
			},
		}

		require('bufferline').setup {
			options = {
				indicator = {
					icon = '',
					style = 'icon',
				},
				modified_icon = '●',
				buffer_close_icon = '',
				left_trunc_marker = '',
				right_trunc_marker = '',
				separator_style = 'thin',
			},
		}
		
		if Packer_bootstrap then
			require('packer').sync()
		end
	end)
end

return M
