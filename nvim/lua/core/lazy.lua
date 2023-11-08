local argc = vim.fn.argc() or 0
if argc > 0 then
	local arg = vim.fn.argv()
	for i = 1, argc do
		if arg[i] == '--headless' then
			return
		end
	end
end

local loader = require('utils.helper').loader
local start = vim.loop.now()

local createdir = function()
	local global = require('core.global')
	local data_dir = {
		global.cache_dir .. 'backup',
		global.cache_dir .. 'sessions',
		global.cache_dir .. 'swap',
		global.cache_dir .. 'tags',
		global.cache_dir .. 'undo',
	}
	if vim.fn.isdirectory(global.cache_dir) == 0 then
		os.execute('mkdir -p ' .. global.cache_dir)
		for _, v in pairs(data_dir) do
			if vim.fn.isdirectory(v) == 0 then
				os.execute('mkdir -p ' .. v)
			end
		end
	end
end

function Lazyload()
	require('core.helper').init()
	createdir()

	loader('plenary.nvim')

	loader('nvim-lspconfig')
	vim.cmd "silent! do FileType"

	loader('nvim-treesitter')

	local plugins = 'nvim-treesitter-textobjects nvim-ts-autotag nvim-ts-context-commentstring nvim-treesitter-textsubjects nvim-treesitter-context'
	loader(plugins)
	loader('refactoring.nvim')
	loader('indent-blankline.nvim')

	loader('bufferline.nvim')

end

local lazy_timer = 5

vim.defer_fn(function()
  Lazyload()
  vim.cmd([[doautocmd User LoadLazyPlugin]])
end, lazy_timer)

vim.defer_fn(function()
	vim.cmd('highlight clear ColorColumn')
	loader('noice.nvim')
	require('modules.ui.lualine')
	loader('vim-hexokinase')
end, lazy_timer + 5)

vim.defer_fn(function()
	local gitrepo = vim.fn.isdirectory('.git/index')
	if gitrepo then
		loader('gitsigns.nvim')
	end
end, lazy_timer + 10)
