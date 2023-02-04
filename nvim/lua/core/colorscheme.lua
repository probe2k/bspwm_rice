local M = {}

function M.config()
	local status, _ = pcall(vim.cmd, "colorscheme tokyonight-night")
	if not status then
		print("Colorscheme not found")
		return
	end
end

return M
