local cmp = require 'cmp'

local options = {
	require('luasnip/loaders/from_vscode').lazy_load(),

	preselect = cmp.PreselectMode.None,

	completion = {
		completeopt='menu,menuone,noselect,noinsert',
	},

	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},

	mapping = cmp.mapping({
		['<C-k>'] = cmp.mapping.select_prev_item(), -- previous suggestion
		['<C-j>'] = cmp.mapping.select_next_item(), -- next suggestion
		['<C-b>'] = cmp.mapping.scroll_docs(4),
		['<C-f>'] = cmp.mapping.scroll_docs(-4),
		['<C-space>'] = cmp.mapping.complete(), -- show completion suggestions
		['<C-e>'] = cmp.mapping.abort(), -- close completion window
		['<CR>'] = cmp.mapping.confirm({ select = false }),
	}),

	sources = cmp.config.sources({
		{ name = 'nvim_lsp' }, -- lsp
		{ name = 'luasnip' }, -- snippets
		{ name = 'buffer' }, -- text from current buffer
		{ name = 'path' }, -- file system paths
	}),

	formatting = {
		format = require('lspkind').cmp_format({
			maxwidth = 50,
			ellipsis_char = '...',
		}),
	},
}

return options
