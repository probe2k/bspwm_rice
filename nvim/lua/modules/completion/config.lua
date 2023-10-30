local global = require('core.global')
local config = {}

function config.nvim_lsp()
	require('modules.completion.lsp')
end

function config.mason()
	local lsp_list = { 'lua-language-server', 'pyright' }

	require('mason').setup({
		ensure_installed = lsp_list,

		PATH = 'skip',

		ui = {
			icons = {
				package_pending = ' ',
				package_installed = '󰄳 ',
				package_uninstalled = ' 󰚌',
			},
		},

		max_concurrent_installers = 10,
	})

	vim.api.nvim_create_user_command('MasonInstallAll', function()
		vim.cmd('MasonInstall ' .. table.concat(lsp_list, ' '))
		end, {})

	vim.g.mason_binaries_list = lsp_list
end

function config.lspsaga()
	require('lspsaga').setup({
		scroll_preview = { scroll_down = '<C-f>', scroll_up = '<C-b>' },
		definition = {
			edit = '<CR>',
		},
		ui = {
			colors = {
				normal_bg = '#022746',
			},
		},
	})
end

function config.nvim_cmp()
	local cmp = require('cmp')

	local has_words_before = function()
		local line, col = unpack(vim.api.nvim_win_get_cursor(0))
		return col ~= 0
			and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
	end

	local luasnip = require('luasnip')
	local comp_kind

	local t = function(str)
		return vim.api.nvim_replace_termcodes(str, true, true, true)
	end

	local check_back_space = function()
		local col = vim.fn.col('.') - 1
		return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
	end

	local sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'treesitter', keyword_length = 2 },
    { name = 'emoji' },
		{ name = 'buffer' },
    { name = 'path' },
	}

	if vim.o.ft == 'markdown' or vim.o.ft == 'txt' or vim.o.ft == 'html' or vim.o.ft == 'gitcommit' then
    table.insert(sources, { name = 'spell' })
    table.insert(sources, { name = 'look' })
	end

  if vim.o.ft == 'lua' then
    table.insert(sources, { name = 'nvim_lua' })
  end

  if vim.o.ft == 'zsh' or vim.o.ft == 'sh' or vim.o.ft == 'fish' or vim.o.ft == 'proto' then
    table.insert(sources, { name = 'buffer', keyword_length = 3 })
    table.insert(sources, { name = 'calc' })
  end

	local compare = require('cmp.config.compare')

	cmp.setup({
		require('luasnip.loaders.from_vscode').lazy_load(),

		preselect = cmp.PreselectMode.None,

		snippet = {
			expand = function(args)
				require('luasnip').lsp_extend(args.body)
			end,
		},

    completion = {
      autocomplete = { require('cmp.types').cmp.TriggerEvent.TextChanged },
			completeopt = 'menu,menuone,noselect,noinsert',
		},

		mapping = cmp.mapping({
			['<C-k>'] = cmp.mapping.select_prev_item(),
			['<C-j>'] = cmp.mapping.select_next_item(),
			['<C-b>'] = cmp.mapping.scroll_docs(4),
			['<C-f>'] = cmp.mapping.scroll_docs(-4),
			['<C-space>'] = cmp.mapping.complete(),
			['<C-e>'] = cmp.mapping.abort(),
			['<CR>'] = cmp.mapping.confirm({ select = false }),
		}),

		sources = sources,
	})

	require('utils.helper').loader('nvim-autopairs')
	local cmp_autopairs = require('nvim-autopairs.completion.cmp')
	cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { text = '' } }))

	cmp.setup.cmdline(':', {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = 'path' },
		}, {
			{ name = 'cmdline_history' },
			{
				name = 'cmdline',
				option = {
					ignore_cmds = { 'Man', '!' },
				},
			},
		}),
	})

  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' },
      { name = 'cmdline_history' },
    },
  })
end

function config.vim_vsnip()
	vim.g.vsnip_snippet_dir = global.home .. '/.config/nvim/snippets'
end

function config.telescope_preload()
	require('utils.helper').loader({ 'plenary.nvim' })
end

function config.telescope()
	local actions = require('telescope.actions')
	require('telescope').setup({
		defaults = {
			prompt_prefix = '🙊 ',
			selection_caret = [[🦑 ]],
			layout_strategy = 'flex',
			sorting_strategy = 'ascending',
			selection_strategy = 'closest',
			file_ignore_patterns = { 'node_modules', 'vendor', 'site-packages' },
			mappings = {
				i = {
					['<esc>'] = actions.close,
					['<C-k>'] = actions.move_selection_previous,
					['<C-j>'] = actions.move_selection_next,
				}
			},
			layout_config = {
				prompt_position = 'top',
				width = 0.9,
				horizontal = {
					preview_width = 0.6,
				},
				vertical = {
					mirror = true,
					width = 0.75,
					height = 0.85,
					preview_height = 0.4,
				},
				flex = {
					flip_columns = 160,
				},
			},
		},
	})
end

return config
