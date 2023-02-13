local M = {}

function M.config()
	local cmp_status, cmp = pcall(require, "cmp")
	if not cmp_status then
		return
	end

	local luasnip_status, luasnip = pcall(require, "luasnip")
	if not luasnip_status then
		return
	end

	local lspkind_status, lspkind = pcall(require, "lspkind")
	if not lspkind_status then
		return
	end

	-- load friendly-snippets
	require("luasnip/loaders/from_vscode").lazy_load()
	vim.opt.completeopt = "menu,menuone,noselect"

	cmp.setup({
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},

		mapping = cmp.mapping.preset.insert({
			["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
			["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
			["<C-b>"] = cmp.mapping.scroll_docs(4),
			["<C-f>"] = cmp.mapping.scroll_docs(-4),
			["<C-space>"] = cmp.mapping.complete(), -- show completion suggestions
			["<C-e>"] = cmp.mapping.abort(), -- close completion window
			["<CR>"] = cmp.mapping.confirm({ select = false }),
		}),

		sources = cmp.config.sources({
			{ name = "nvim_lsp" }, -- lsp
			{ name = "luasnip" }, -- snippets
			{ name = "buffer" }, -- text from current buffer
			{ name = "path" }, -- file system paths
		}),

		formatting = {
			format = lspkind.cmp_format({
				maxwidth = 50,
				ellipsis_char = "...",
			}),
		},
	})
end

return M
