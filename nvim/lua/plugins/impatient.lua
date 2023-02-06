local M = {}

function M.config()
	local status, impatient = pcall(require, "impatient")
	if not status then
		return
	end

	_G.__luacache_config = {
		chunks = {
			enable = true,
			path = vim.fn.stdpath('cache')..'/luacache_chunks',
		},
		modpaths = {
			enable = true,
			path = vim.fn.stdpath('cache')..'/luacache_modpaths'
		}
	}
end

return M
