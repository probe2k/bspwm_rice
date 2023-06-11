local M = {}

local keymap = vim.keymap

M.on_attach = function(client, bufnr)
	client.server_capabilities.documentFormattingProvider = false
	client.server_capabilities.documentRangeFormattingProvider = false

	local opts = { noremap = true, silent = true, buffer = bufnr }

	-- set keybinds
	keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
	keymap.set('n', 'gD', '<cmd>Lspsaga peek_definition<CR>', opts)
	keymap.set('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', opts)
	keymap.set('n', '<leader>rn', '<cmd>Lspsaga rename<CR>', opts)
	keymap.set('n', '<leader>d', '<cmd>Lspsaga show_line_diagnostics<CR>', opts)
	keymap.set('n', '[d', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
	keymap.set('n', ']d', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)
	keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>', opts)

	local signs = { Error = '✗ ', Warn = ' ', Hint = ' ', Info = ' ' }
	for type, icon in pairs(signs) do
		local hl = 'DiagnosticSign' .. type
		vim.fn.sign_define(hl, { text = icon, texthl= hl, numhl = hl })
	end
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
	documentationFormat = { "markdown", "plaintext" },
	snippetSupport = true,
	preselectSupport = true,
	insertReplaceSupport = true,
	labelDetailsSupport = true,
	deprecatedSupport = true,
	commitCharactersSupport = true,
	tagSupport = { valueSet = { 1 } },
	resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
		},
	},
}

require('lspconfig').lua_ls.setup {
	on_attach = M.on_attach,
	capabilities = M.capabilities,

	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' },
			},
			workspace = {
				library = {
					[vim.fn.expand "$VIMRUNTIME/lua"] = true,
					[vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
				},
				maxPreload = 10000,
				preloadFileSize = 10000,
			},
		},
	},
}

require('lspconfig').tsserver.setup {
	on_attach = M.on_attach,
	capabilities = M.capabilities,
}

require('lspconfig').gopls.setup {
	on_attach = M.on_attach,
	capabilities = M.capabilities,
}

return M
