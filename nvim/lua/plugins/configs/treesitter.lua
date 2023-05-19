local M = {}

function M.config()
	local status, treesitter = pcall(require, 'nvim-treesitter.configs')
	if not status then
		return
	end

	treesitter.setup({
		highlight = { enable = true },
		indent = { enable = true },
		ensure_installed = {
			'json',
			'javascript',
			'java',
			'yaml',
			'html',
			'css',
			'markdown',
			'bash',
			'lua',
			'dockerfile',
			'gitignore',
			'go',
			'c',
			'cmake',
			'cpp',
			'dart',
			'dockerfile',
			'go',
			'gomod',
			'gosum',
			'python',
			'rust',
			'markdown',
			'markdown_inline',
		},
		auto_install = true,
	})
end

return M
