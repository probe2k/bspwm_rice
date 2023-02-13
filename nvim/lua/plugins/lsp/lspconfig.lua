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
		local opts = { noremap = true, silent = true, buffer = bufnr }

		-- set keybinds
		keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts)
		keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
		keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
		keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
		keymap.set("n", "<leader>f", "<cmd>Lspsaga code_action<CR>", opts)
		keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
		keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
		keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
		keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
		keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
		keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
		keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts)
	end

	-- enable autocompletion
	local capabilities = cmp_nvim_lsp.default_capabilities()

	lspconfig["emmet_ls"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})

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

	lspconfig["bashls"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})

	lspconfig["clangd"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})

	lspconfig["gopls"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})

	lspconfig["jdtls"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})

	lspconfig["marksman"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})

	lspconfig["pyright"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})

	lspconfig["rust_analyzer"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})

	lspconfig["solidity"].setup({
		capabilities = capabilities,
		on_attach = on_attach,
		root_dir = function()
			return vim.fn.getcwd()
		end,
	})

	local signs = { Error = "ﮊ ", Warn = " ", Hint = " ", Info = " " }
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl= hl, numhl = hl })
	end
end

return M
