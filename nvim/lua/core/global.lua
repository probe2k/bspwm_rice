local global = {}

local home = os.getenv('HOME')
local path_sep = '/'

function global:load_variables()
	self.path_sep = '/'
	self.vim_path = vim.fn.stdpath('config')

	self.cache_dir = home .. path_sep .. '.local' .. path_sep .. 'share' .. path_sep .. 'nvim' .. path_sep
	self.home = home
	self.data_dir = vim.fn.stdpath('data')
	self.cache_dir = vim.fn.stdpath('cache')
	self.log_dir = self.cache_dir

	self.log_path = string.format('%s%s%s', self.log_dir, path_sep, 'nvim_debug.log')
end

global:load_variables()

return global
