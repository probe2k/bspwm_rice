local M = {}

M.lazy_load = function(plugin)
	vim.api.nvim_create_autocmd({ 'BufRead', 'BufWinEnter', 'BufNewFile' }, {
		callback = function()
			require("lazy").load { plugins = plugin }

--			if plugin == "nvim-lspconfig" then
--				vim.cmd "silent! do FileType"
--			end
		end,
	})
end

return M
