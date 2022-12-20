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
		vim.cmd [[ packadd packer.nvim ]]
	end

	require('packer').startup(function(use)
		use { 'wbthomason/packer.nvim' }
		use 'nvim-lualine/lualine.nvim'
		use 'kyazdani42/nvim-web-devicons'
		use 'akinsho/bufferline.nvim'
		use 'ap/vim-css-color'
		use 'tpope/vim-fugitive'
		use ('plasticboy/vim-markdown', {['for'] = 'markdown'})
		use 'ryanoasis/vim-devicons'
		use 'preservim/nerdtree'
		
		require('lualine').setup {
			options = {
				component_separators = '',
				section_separators = { left = '', right = '' },
			}
		}

		require('bufferline').setup {
			options = {
				indicator = {
					icon = '│',
					style = 'icon',
				},
				modified_icon = '●',
				buffer_close_icon = '',
				left_trunc_marker = '',
				right_trunc_marker = '',
				separator_style = 'thin',
			},
			highlights = {
				buffer_selected = { italic = false },
				diagnostic_selected = { italic = false },
				hint_selected = { italic = false },
				pick_selected = { italic = false },
				pick_visible = { italic = false },
				pick = { italic = false },
			},
		}

		if Packer_bootstrap then
			require('packer').sync()
		end
	end)
end

return M
