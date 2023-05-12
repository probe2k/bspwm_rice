local vim = vim

local M = {}

function M.config()
	local set = vim.opt

	-- line numbers
	set.relativenumber = true
	set.number = true

	-- casing
	set.ignorecase = true
	set.smartcase = true

	-- text wrap
	set.wrap = false

	-- tabbing and indents
	set.tabstop = 4
	set.shiftwidth = 4
	set.autoindent = true

	-- term color
	set.termguicolors = true

	-- configure clipboard
	set.clipboard:append("unnamedplus")

	-- disable nvim intro
	set.shortmess:append "sI"

	-- enable navigate to new line using hl
	set.whichwrap:append "<>[]hl"

	-- reload on changed buffer
	set.autoread = true

	-- set cmdheight to 0
	set.cmdheight = 0

	-- setup lcs
	set.list = true
	set.listchars = { tab = '  ', eol = '↩', trail = '•', space = '⋅', precedes = '←', extends = '→' }
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

	-- vim tablines
	vim.cmd [[ set showtabline=2 ]]
	vim.cmd [[ set noshowmode ]]

	-- set active cursor as vim cursor
	vim.cmd [[ set guicursor= ]]

	-- set unicode encoding
	vim.cmd [[ set encoding=UTF-8 ]]

	-- set terminal color directive
	vim.cmd [[ set t_Co=256 ]]

	-- enable default syntax highlighting
	vim.cmd [[ syntax enable ]]

	-- set undo history
	vim.cmd [[ set history=100 ]]

	-- split directives
	vim.cmd [[ set splitright splitbelow ]]

	-- miscellaneous
	for _, provider in ipairs { "node", "perl", "python3", "ruby" } do
		vim.g["loaded_" .. provider .. "_provider"] = 0
	end

end

return M
