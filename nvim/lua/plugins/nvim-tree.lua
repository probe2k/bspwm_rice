local M = {}

function M.config()
	local status, nvimtree = pcall(require, "nvim-tree")
	if not status then
		return
	end

	nvimtree.setup({
		sort_by = "case_sensitive",
		renderer = {
			group_empty = true,
		},
		filters = {
			dotfiles = true,
		},
	})
end

return M
