local set = vim.opt

set.relativenumber = true
set.number = true

set.ignorecase = true
set.smartcase = true

set.wrap = false

set.tabstop = 4
set.shiftwidth = 4
set.smartindent = true

set.termguicolors = true

set.clipboard:append("unnamedplus")

set.shortmess:append("sI")

set.autoread = true

set.mouse = ""

set.cmdheight = 0

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

set.showtabline = 2
set.showmode = false
--
-- vim.cmd [[ set guicursor= ]]
--
set.whichwrap:append "<>[]hl"

set.guicursor = ""

set.history = 100

set.splitbelow = true
set.splitright = true

for _, provider in ipairs { "node", "perl", "python3", "ruby" } do
	vim.g["loaded_" .. provider .. "_provider"] = 0
end
