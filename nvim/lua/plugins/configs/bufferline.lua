local M = {}

function M.config()
	local status, bufferline = pcall(require, "bufferline")
	if not status then
		return
	end

	bufferline.setup({
		options = {
			indicator = {
				icon = '',
				style = 'icon',
			},
			modified_icon = '●',
			buffer_close_icon = '',
			left_trunc_marker = '',
			right_trunc_marker = '',
			separator_style = 'thin',
			color_icons = true,
			diagnostics = "nvim_lsp",
			diagnostics_update_in_insert = false,
			diagnostics_indicator = function(count, level, diagnostics_dict, context)
				local icon = level:match("error") and " " or " "
				return " " .. icon .. count
			end,
		},
	})
end

return M
