local M = {}

function M.config()
	local mason_status, mason = pcall(require, "mason")
	if not mason_status then
		return
	end

	local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
	if not mason_lspconfig then
		return
	end

	mason.setup()

	mason_lspconfig.setup({
		ensure_installed = {
			"bashls",
			"clangd",
			"emmet_ls",
			"golangci_lint_ls",
			"jdtls",
			"sumneko_lua",
			"marksman",
			"pyright",
			"rust_analyzer",
		},
	})
end

return M