local vim = vim

local M = {}

function M.config()
	local set = vim.opt
	vim.cmd [[ set showtabline=2 ]]
	vim.cmd [[ set noshowmode ]]
	vim.cmd [[ set autoindent ]]
	vim.cmd [[ set encoding=UTF-8 ]]
	vim.cmd [[ set t_Co=256 ]]
	vim.cmd [[ syntax enable ]]
	vim.cmd [[ colorscheme moonlight ]]
	vim.cmd [[ set history=100 ]]
	set.list = true
	set.termguicolors = true
	set.listchars = { tab = '│ ', eol = '↩', trail = '•', space = '⋅', precedes = '←', extends = '→' }
	set.fillchars = {
		stl = ' ',
		stlnc = ' ',
		diff = '∙',
		eob = ' ',
		fold = '·',
		horiz = '━',
		horizup = '┻',
		horizdown = '┳',
		vert = '┃',
		vertleft = '┫',
		vertright = '┣',
		verthoriz = '╋'
	}
	set.wrap = false
	set.tabstop = 4
	set.shiftwidth = 4
	vim.cmd [[ set relativenumber ]]
	vim.cmd [[ set number ]]
	vim.cmd [[ set ignorecase ]]
	vim.cmd [[ set smartcase ]]
	vim.cmd [[ set splitright splitbelow ]]
	vim.cmd [[ set guicursor= ]]
	vim.cmd [[ set clipboard+=unnamedplus ]]
end

return M
