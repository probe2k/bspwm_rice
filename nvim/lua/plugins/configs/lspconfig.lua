local M = {}

function M.config()
	local lspconfig_status, lspconfig = pcall(require, "lspconfig")
	if not lspconfig_status then
		return
	end

	local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
	if not cmp_nvim_lsp_status then
		return
	end

	local keymap = vim.keymap

	-- enable keybinds for available lsp server
	local on_attach = function(client, bufnr)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false

		local opts = { noremap = true, silent = true, buffer = bufnr }

		-- set keybinds
		keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
		keymap.set("n", "gD", "<cmd>Lspsaga peek_definition<CR>", opts)
		keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
		keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
		keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
		keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
		keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
	end

	-- enable autocompletion
	local capabilities = vim.lsp.protocol.make_client_capabilities()

	lspconfig["lua_ls"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.stdpath("config") .. "/lua"] = true,
					},
				},
			},
		},
	})

	lspconfig["tsserver"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})

	local signs = { Error = "✗ ", Warn = " ", Hint = " ", Info = " " }
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl= hl, numhl = hl })
	end
end

return M
