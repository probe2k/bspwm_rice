local vim = vim

local M = {}

function M.config()
	local set = vim.opt
	vim.cmd [[ set showtabline=2 ]]
	vim.cmd [[ set noshowmode ]]
	vim.cmd [[ set guicursor= ]]
	vim.cmd [[ set autoindent ]]
	vim.cmd [[ set encoding=UTF-8 ]]
	vim.cmd [[ set t_Co=256 ]]
	vim.cmd [[ syntax enable ]]
	vim.cmd [[ set history=100 ]]
	vim.cmd [[ set splitright splitbelow ]]
	vim.cmd [[ set clipboard+=unnamedplus ]]
	vim.cmd [[ let g:python_recommended_style=0 ]]
	vim.cmd [[ let g:NERDTreeWinPos=1 ]]
	vim.cmd.colorscheme "kanagawa"
	set.relativenumber = true
	set.number = true
	set.ignorecase = true
	set.smartcase = true
	set.wrap = false
	set.tabstop = 4
	set.shiftwidth = 4
	set.termguicolors = true
	set.list = true
	set.listchars = { tab = '│ ', eol = '↲', trail = '•', space = '⋅', precedes = '←', extends = '→' }
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
end

return M
