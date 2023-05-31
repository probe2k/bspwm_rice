local set = vim.opt

-- line configurations
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
set.smartindent = true

-- term color
set.termguicolors = true

-- configure clipboard
set.clipboard:append('unnamedplus')

-- disable nvim intro
set.shortmess:append('sI')

-- reload on changed buffer
set.autoread = true

-- disable mouse inside nvim
set.mouse = ''

-- remove cmd on idle
set.cmdheight = 0

-- setup lcs
set.list = true
set.listchars = { tab = '  ', eol = '↲', trail = '•', space = '⋅', precedes = '←', extends = '→' }
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
set.showtabline = 2
set.showmode = false

-- enable EOL navigate using hl
set.whichwrap:append '<>[]hl'

-- set active cursor as vim cursor
set.guicursor = ''

-- set undo history
set.history = 100

-- split directives
set.splitbelow = true
set.splitright = true

-- miscellaneous
for _, provider in ipairs { 'node', 'perl', 'python3', 'ruby' } do
	vim.g['loaded_' .. provider .. '_provider'] = 0
end
