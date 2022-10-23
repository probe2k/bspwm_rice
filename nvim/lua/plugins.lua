local vim = vim

local M = {}

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
	vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
	use { 'wbthomason/packer.nvim' }
	use "rafamadriz/neon"
	use 'nvim-lualine/lualine.nvim'
	use 'kyazdani42/nvim-web-devicons'
	use 'akinsho/bufferline.nvim'
	use 'ryanoasis/vim-devicons'
	use 'ap/vim-css-color'
	use 'tpope/vim-fugitive'
	use ('plasticboy/vim-markdown', {['for'] = 'markdown'})
	use 'preservim/nerdtree'
	use 'lukas-reineke/indent-blankline.nvim'

	require('lualine').setup{
		options = {
			component_separators = '',
			section_separators = { left = '', right = '' },
		}
	}

	require('lualine').setup {
		options = {
			theme = 'neon'
		}
	}
	
	vim.opt.termguicolors = true
	vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
	vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
	vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
	vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
	vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
	vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]
	require('indent_blankline').setup {
		space_char_blankline = ' ',
		char_highlight_list = {
			"IndentBlanklineIndent1",
    	"IndentBlanklineIndent2",
    	"IndentBlanklineIndent3",
    	"IndentBlanklineIndent4",
    	"IndentBlanklineIndent5",
    	"IndentBlanklineIndent6",
		}
	}

	require('bufferline').setup{
		options = {
			indicator = {
				icon = '|', -- this should be omitted if indicator style is not 'icon'
				style = 'icon',
			},
			buffer_close_icon = '',
			modified_icon = '●',
			close_icon = '',
			left_trunc_marker = '',
			right_trunc_marker = '',
			separator_style = "thin",
		}
	}

	if Packer_bootstrap then
		require('packer').sync()
	end
end)

end

return M
