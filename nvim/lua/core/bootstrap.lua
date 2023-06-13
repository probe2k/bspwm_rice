local M = {}

M.lazy = function (lazypath)
	vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', -- latest stable release
		lazypath,
	})

	vim.opt.rtp:prepend(lazypath)

	require 'plugins'
end

return M
