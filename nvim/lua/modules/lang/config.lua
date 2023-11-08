local config = {}

function config.syntax_folding()
	vim.api.nvim_command('setlocal foldmethod=expr')
	vim.api.nvim_command('setlocal foldexpr=nvim_treesitter#foldexpr()')
end

function config.refactor()
	local refactor = require('refactoring')

	refactor.setup({})

	_G.ts_refactors = function()
		local function _refactor(prompt_bufnr)
			local content = require('telescope.actions.state').get_selected_entry(prompt_bufnr)
			require('telescope.actions').close(prompt_bufnr)
			require('refactoring').refactor(content.value)
		end

		local opts = require('telescope.themes').get_cursor() -- set personal telescope options
		require('telescope.pickers')
		.new(opts, {
			prompt_title = 'refactors',
			finder = require('telescope.finders').new_table({
				results = require('refactoring').get_refactors(),
			}),
			sorter = require('telescope.config').values.generic_sorter(opts),
			attach_mappings = function(_, map)
				map('i', '<CR>', _refactor)
				map('n', '<CR>', _refactor)
				return true
			end,
		})
		:find()
	end
end

function config.context_vt()
	require('nvim_context_vt').setup({
		enabled = true,
		disable_ft = { 'markdown' },
		disable_virtual_lines = false,
		min_rows = 1,
		min_rows_ft = {},

		custom_parser = function(node, ft, opts)
			local utils = require('nvim_context_vt.utils')

			local start_row, _, end_row, _ = vim.treesitter.get_node_range(node)
			return string.format(' -> <%d:%d> %s', start_row + 1, end_row + 1, utils.get_node_text(node)[1])
		end,
	})
end

return config
