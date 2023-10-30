local conf = require('modules.lang.config')
local dev = plugin_folder():find('github') ~= nil or plugin_folder():find('probe2k') ~= nil
local ts = require('modules.lang.treesitter')

return function(lang)
	lang({ 'nvim-treesitter/nvim-treesitter', lazy = true, config = ts.treesitter, module = false })

	lang({ 'nvim-treesitter/nvim-treesitter-textobjects', config = ts.treesitter_obj, module = false, lazy = true })

	lang({ 'RRethy/nvim-treesitter-textsubjects', config = ts.treesitter_obj, module = false, lazy = true })

	lang({ 'nvim-treesitter/nvim-treesitter-refactor', config = ts.treesitter_ref, lazy = true })

	lang({ 'ThePrimeagen/refactoring.nvim', lazy = true, config = conf.refactor })

	lang({ 'haringsrob/nvim_context_vt', lazy = true, event = { 'CursorHold', 'WinScrolled', 'CursorMoved' }, config = conf.context_vt })

	lang({ 'JoosepAlviste/nvim-ts-context-commentstring', lazy = true })

	lang({ 'windwp/nvim-ts-autotag', lazy = true })

	lang({
		'nvim-treesitter/nvim-treesitter-context',
		lazy = true,
		module = false,
		config = function()
			require('treesitter-context').setup({
				enable = true,
				max_lines = 2,
				trim_scope = 'outer',
				mode = 'topline',
				patterns = {
					default = {
						'class',
						'function',
						'method',
						'for',
						'while',
						'if',
						'switch',
					},
				},
			})
		end,
	})

	lang({
		'mechatroner/rainbow_csv',
		ft = { 'csv', 'tsv', 'dat' },
		lazy = true,
    cmd = { 'RainbowDelim', 'RainbowMultiDelim', 'Select', 'CSVLint' },
	})
end
