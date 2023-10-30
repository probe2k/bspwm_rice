local global = require('core.global')
local vim = vim

local createdir = function()
	local data_dir = {
		global.cache_dir .. 'backup',
		global.cache_dir .. 'session',
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

local disable_distribution_plugins = function()
	vim.g.loaded_matchparen = 1
	vim.g.loaded_2html_plugin = 1
	vim.g.loaded_tohtml = 1
	vim.g.loaded_getscript = 1
	vim.g.loaded_getscriptPlugin = 1
	vim.g.loaded_gzip = 1
	vim.g.loaded_logipat = 1
	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1
	vim.g.loaded_netrwSettings = 1
	vim.g.loaded_netrwFileHandlers = 1
	vim.g.loaded_matchit = 1
	vim.g.loaded_tar = 1
	vim.g.loaded_tarPlugin = 1
	vim.g.loaded_rrhelper = 1
	vim.g.loaded_spellfile_plugin = 1
	vim.g.loaded_vimball = 1
	vim.g.loaded_vimballPlugin = 1
	vim.g.loaded_zip = 1
	vim.g.loaded_zipPlugin = 1
	vim.g.loaded_tutor = 1
	vim.g.loaded_rplugin = 1
	vim.g.loaded_optwin = 1
	vim.g.loaded_compiler = 1
	vim.g.loaded_bugreport = 1
	vim.g.loaded_ftplugin = 1
end

local leader_map = function()
	vim.g.mapleader = ' '
	vim.g.maplocalleader = ' '
end

local load_core = function()
	require('core.helper').init()

	createdir()
	disable_distribution_plugins()
	leader_map()

	-- disable highlights
	vim.api.nvim_set_hl(0, 'StatusLine', { bg = 'None' })
	vim.api.nvim_set_hl(0, 'Normal', { bg = 'None' })
	vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'None' })
	vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'None' })
	vim.api.nvim_set_hl(0, 'FoldColumn', { bg = 'None' })

	vim.env.PATH = vim.env.PATH .. ":" .. vim.fn.stdpath "data" .. "/mason/bin"

	require('core.options')
	require('core.mappings')
	require('core.events')
	_G.lprint = require('utils.log').lprint
	require('core.lazy_nvim'):boot_strap()
	vim.defer_fn(function()
		lprint('load compiled and lazy')
		require('core.colorscheme').load_colorscheme()
		require('core.lazy')
	end, 5)
end

load_core()
