local config = {}
math.randomseed(os.time())

function config.noice()
	require('noice').setup({
		cmdline = {
			enabled = true,
			view = 'cmdline_popup',
		},

		messages = {
			enabled = false,
		},

		popupmenu = {
			enabled = true,
		},

		lsp = {
			progress = {
				enabled = false,
			},
			hover = {
				enabled = false,
			},

			signature = {
				enabled = false,
			},
		},
	})
end

function config.nvim_bufferline()
	require('bufferline').setup({
		options = {
			indicator = {
				icon = '▊',
				style = 'icon',
			},
			truncate_names = false,
			modified_icon = '●',
			color_icons = true,
			show_buffer_icons = true,
			show_buffer_close_icons = false,
			separator_style = thin,
			left_trunc_marker = '<U+F0A8>',
			right_trunc_marker = '<U+F0A9>',
			diagnostics = 'nvim_lsp',
			diagnostics_indicator = function(count, level)
				local icon = level:match('error') and ' ' or ' '
				return ' ' .. icon .. count
			end,
			always_show_bufferline = false,
		},
		highlights = {
			buffer_selected = {
				bold = true,
				italic = true,
				sp = '#ef8f8f'
			},
			tab_selected = {
				sp = '#af6faf',
			},
		},
	})
end

function config.nvim_tree_setup()
	vim.cmd([[autocmd Filetype NvimTree set cursorline | set statuscolumn=]])
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
	vim.keymap.set('n', 'E', api.tree.expand_all, opts('Expand All'))
	vim.keymap.set('n', 'W', api.tree.collapse_all, opts('Collapse All'))
end

function config.nvim_tree()
	require('nvim-tree').setup({
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

--function config.cat()
--	require('catppuccin').setup({
--		flavor = 'mocha',
--		lsp_trouble = false,
--		transparent_background = true,
--		dim_inactive = { enabled = false },
--	})
--
--	vim.cmd('colorscheme catppuccin')
--end

function config.starry()
	vim.g.starry_style = 'earlysummer'
  vim.g.starry_bold = true
  vim.g.starry_italic_comments = true
  vim.g.starry_italic_keywords = false
  vim.g.starry_italic_functions = true
  vim.g.starry_italic_variables = false
  vim.g.starry_italic_string = false
  vim.g.starry_contrast = true
  vim.g.starry_borders = true
  vim.g.starry_set_hl = true
  vim.g.starry_style_fix = true
	vim.g.starry_disable_background = true

	vim.cmd('colorscheme starry')
end

vim.api.nvim_create_user_command('Transparent', function()
	vim.api.nvim_set_hl(0, 'Normal', { bg = 'NONE', ctermbg = 'NONE' })
	vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'NONE', ctermbg = 'NONE' })
	vim.api.nvim_set_hl(0, 'EndOfBuffer', { bg = 'NONE', ctermbg = 'NONE' })
end, { nargs = '*' })

function config.blankline()
	vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
	vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
	vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
	vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
	vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
	vim.cmd [[highlight IndentBlanklineIndent5 guifg=#C678DD gui=nocombine]]

	require('indent_blankline').setup({
		enabled = true,
		char_list = { '', '┊', '┆', '¦', '|', '¦', '┆', '┊', '' },
		filetype_exclude = {
			'help',
			'startify',
			'dashboard',
			'NvimTree',
		},
		show_trailing_blankline_indent = false,
		show_first_indent_level = false,
		buftype_exclude = { 'terminal' },
		space_char_blankline = ' ',
		use_treesitter = true,
		show_current_context = true,
		show_current_context_start = true,
		char_highlight_list = {
			'IndentBlanklineIndent1',
			'IndentBlanklineIndent2',
			'IndentBlanklineIndent3',
			'IndentBlanklineIndent4',
			'IndentBlanklineIndent5',
			'IndentBlanklineIndent6',
		},
		context_patterns = {
			'class',
			'return',
			'function',
			'method',
			'^if',
			'if',
			'^while',
			'jsx_element',
			'^for',
			'for',
			'^object',
			'^table',
			'block',
			'arguments',
			'if_statement',
			'else_clause',
			'jsx_self_closing_element',
			'try_statement',
			'catch_clause',
			'import_statement',
			'operation_type',
		},
		bufname_exclude = { 'README.md' },
	})
end

return config
