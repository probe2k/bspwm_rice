local M = {}

function M.config()
	local status, impatient = pcall(require, "impatient")
	if not status then
		return
	end

	_G.__luacache_config = {
		chunks = {
			enable = true,
			path = vim.fn.stdpath('data')..'/cache/luacache_chunks',
		},
		modpaths = {
			enable = true,
			path = vim.fn.stdpath('data')..'/cache/luacache_modpaths'
		}
	}
end

return M
