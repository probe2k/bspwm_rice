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

	use 'nvim-lualine/lualine.nvim'
	use 'kyazdani42/nvim-web-devicons'
	use 'akinsho/bufferline.nvim'
	use 'ryanoasis/vim-devicons'
	use 'ap/vim-css-color'
	use 'tpope/vim-fugitive'
	use ('plasticboy/vim-markdown', {['for'] = 'markdown'})
    use 'preservim/nerdtree'

	require('lualine').setup{
		options = {
			component_separators = '',
			section_separators = { left = '', right = '' },
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
