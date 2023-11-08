local config = {}

function config.markdown()
	vim.g.vim_markdown_frontmatter = 1
	vim.g.vim_markdown_strikethrough = 1
	vim.g.vim_markdown_folding_level = 6
	vim.g.vim_markdown_override_foldtext = 1
	vim.g.vim_markdown_folding_style_pythonic = 1
	vim.g.vim_markdown_conceal = 1
	vim.g.vim_markdown_conceal_code_blocks = 1
	vim.g.vim_markdown_new_list_item_indent = 0
	vim.g.vim_markdown_toc_autofit = 0
	vim.g.vim_markdown_edit_url_in = 'vsplit'
	vim.g.vim_markdown_strikethrough = 1
	vim.g.vim_markdown_fenced_languages = {
		'c++=javascript',
		'js=javascript',
		'json=javascript',
		'jsx=javascript',
		'tsx=javascript',
	}
end

function config.floaterm()
	require('toggleterm').setup({
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
			winblend = 3,
			highlights = {
				border = 'Normal',
--				background = 'Normal',
			},
		},
	})
end

function config.git()
	require('gitsigns').setup({
		signs = {
			add = { text = "│" },
			change = { text = "│" },
			delete = { text = "" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "│" },
		},
		update_debounce = 400,
		numhl = true,
		word_diff = true,
		watch_gitdir = { interval = 1000, follow_files = true },
		status_formatter = nil, -- Use default
		debug_mode = false,
		current_line_blame = true,
		current_line_blame_opts = { delay = 1500 },
		diff_opts = { internal = true },
	})
end

return config
