local M = {}

M.lazy_load = function(plugin)
	require('lazy').load { plugins = plugin }
end

return M
