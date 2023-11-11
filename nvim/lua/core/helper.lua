_G = _G or {}

fn = vim.fn

local global = require('core.global')

local function exists(file)
	local ok, _, code = os.rename(file, file)
	if not ok then
		if code == 13 then
			return true
		end
	end
	return ok
end

local helper = {
	init = function()
		_G.compare_to_clipboard = function()
			local ftype = vim.api.nvim_eval('&filetype')
			vim.cmd(string.format(
			[[
			vsplit
			enew
			normal! P
			setlocal buftype=nowrite
			set filetype=%s
			diffthis
			bprevious
			execute "normal! \<C-w>\<C-w>"
			diffthis
			]],
			ftype
			))
		end

		_G.plugin_debug = function()
			if Plugin_debug ~= nil then
				return Plugin_debug
			end
			local host = os.getenv('HOST_NAME') or vim.fn.hostname()
			if host and host:lower():find('ray') then
				Plugin_debug = true -- enable debug here, will be slow
			else
				Plugin_debug = false
			end
			return Plugin_debug
		end
	end,

	path_sep = global.path_sep,

	get_config_path = function()
		return fn.stdpath('config')
	end,

  get_data_path = function()
    return global.data_dir
  end,

  isdir = function(path)
		return exists(path .. '/')
	end,
}

_G.use_nulls = function()
	return true
end

_G.use_efm = function()
	return false
end

_G.plugin_folder = function()
	if Plugin_folder then
		return Plugin_folder
	end
	local host = os.getenv('HOST_NAME')
	if host and host:lower():find('probe2k') then
		Plugin_folder = [[~/github/probe2k/]] -- vim.fn.expand("$HOME") .. '/github/'
	else
		Plugin_folder = [[probe2k/]]
	end
	return Plugin_folder
end

return helper
