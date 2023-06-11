local actions = require('telescope.actions')

local options = {
	defaults = {
		prompt_prefix = '   ',
		selection_caret = '❯ ',
		mappings = {
			i = {
				['<esc>'] = actions.close,
				['<C-k>'] = actions.move_selection_previous,
				['<C-j>'] = actions.move_selection_next,
			}
		},
		layout_config = {
			horizontal = {
				prompt_position = 'top',
				preview_width = 0.55,
				results_width = 0.8,
			},
			vertical = {
				mirror = false,
			},
			width = 0.87,
			height = 0.80,
			preview_cutoff = 120,
		},
	}
}

return options
