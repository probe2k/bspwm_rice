local M = {}

function M.config()
	local status, nvimtree = pcall(require, 'nvim-tree')
	if not status then
		return
	end

	local function on_attach(bufnr)
		local api = require('nvim-tree.api')

		local function opts(desc)
			return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
		end

		vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
		vim.keymap.set('n', '-', api.tree.change_root_to_parent, opts('Up'))
		vim.keymap.set('n', '=', api.tree.change_root_to_node, opts('CD'))
		vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))
		vim.keymap.set('n', 's', api.node.open.horizontal, opts('Open: Horizontal Split'))
	end

	nvimtree.setup({
		sort_by = 'case_sensitive',
		disable_netrw = true,
		hijack_netrw = true,
		hijack_cursor = true,
		update_cwd = true,
		on_attach = on_attach,
		update_focused_file = {
			enable = true,
			update_cwd = false,
		},
		view = {
			adaptive_size = false,
			side = 'right',
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
			highlight_opened_files = 'none',

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
					default = '',
					symlink = '',
					folder = {
						default = '',
						empty = '',
						empty_open = '',
						open = '',
						symlink = '',
						symlink_open = '',
						arrow_open = '',
						arrow_closed = '',
					},
					git = {
						unstaged = '✗',
						staged = '✓',
						unmerged = '',
						renamed = '➜',
						untracked = '★',
						deleted = '',
						ignored = '◌',
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
