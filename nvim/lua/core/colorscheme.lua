local M = {}

function M.config()
	local status, _ = pcall(vim.cmd, "colorscheme tokyonight-night")
	if not status then
		print("Colorscheme not found")
		return
	end

	vim.cmd [[ hi NonText ctermbg=none ]]
	vim.cmd [[ hi Normal guibg=NONE ctermbg=NONE ]]
	vim.cmd [[ hi NormalNC guibg=NONE ctermbg=NONE ]]
	vim.cmd [[ hi SignColumn guibg=NONE ]]
	vim.cmd [[ hi NvimTreeNormal guibg=NONE ctermbg=NONE ]]
	vim.cmd [[ hi NvimTreeNormalNC guibg=NONE ctermbg=NONE ]]
end

return M
