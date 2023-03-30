local M = {}

function M.config()
	local telescope_setup, telescope = pcall(require, "telescope")
	if not telescope_setup then
		return
	end

	local actions_setup, actions = pcall(require, "telescope.actions")
	if not actions_setup then
		return
	end

	telescope.setup({
		defaults = {
			mappings = {
				i = {
					["<esc>"] = actions.close,
					["<C-k>"] = actions.move_selection_previous,
					["<C-j>"] = actions.move_selection_next,
				}
			}
		}
	})

	telescope.load_extension("fzf")
end

return M
