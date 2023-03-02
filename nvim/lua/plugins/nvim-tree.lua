local M = {}

function M.config()
	local status, nvimtree = pcall(require, "nvim-tree")
	if not status then
		return
	end

	local tree_cb = require'nvim-tree.config'.nvim_tree_callback
	local list = {
		{ key = "+", cb = tree_cb("cd") },
	}

	nvimtree.setup({
		sort_by = "case_sensitive",
		disable_netrw = true,
		hijack_netrw = true,
		update_cwd = true,
		update_focused_file = {
			enable = true,
			update_cwd = false,
		},
		view = {
			mappings = {
				list = list
			},
			adaptive_size = false,
			side = "right",
			width = 30,
			hide_root_folder = false,
		},
		git = {
			enable = true,
			ignore = false,
		},
		filesystem_watchers = {
			enable = true,
		},
		actions = {
			open_file = {
				resize_window = false,
			},
		},
		renderer = {
			highlight_git = true,
			group_empty = true,
			highlight_opened_files = "none",

			indent_markers = {
				enable = true,
			},

			icons = {
				show = {
					file = true,
					folder = true,
					folder_arrow = true,
					git = true,
				},
				glyphs = {
					default = "",
					symlink = "",
					folder = {
						default = "",
						empty = "",
						empty_open = "",
						open = "",
						symlink = "",
						symlink_open = "",
						arrow_open = "",
						arrow_closed = "",
					},
					git = {
						unstaged = "✗",
						staged = "✓",
						unmerged = "",
						renamed = "➜",
						untracked = "★",
						deleted = "",
						ignored = "◌",
					},
				},
			},
		},
		filters = {
			dotfiles = false,
		},
	})
end

return M
