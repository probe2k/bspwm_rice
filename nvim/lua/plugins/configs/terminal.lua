local M = {}

function M.config()
	local status, toggleterm = pcall(require, 'toggleterm')
	if not status then
		return
	end

	toggleterm.setup({
		open_mapping = [[<C-\>]],
		hide_numbers = true,
		shade_filetypes = {},
		shade_terminals = true,
		shading_factor = 2,
		start_in_insert = true,
		insert_mappings = true,
		persist_size = true,
		direction = 'float',
		close_on_exit= true,
		shell = vim.o.shell,
		float_opts = {
			width = function()
				return math.ceil(vim.o.columns * 0.6)
			end,
			height = function()
				return math.ceil(vim.o.lines * 0.7)
			end,
			border = 'curved',
			winblend = 0,
			highlights = {
				border = 'Normal',
				background = 'Normal',
			},
		},
	})

end

return M
