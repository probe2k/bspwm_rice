local M = {}

local vim = vim

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diff = {
	"diff",
	colored = true,
	symbols = {
		added = " ",
		modified = " ",
		removed = " ",
	},
	color = { bg = "#242735" },
	separator = { left = "", right = "" },
}

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = {
		"info",
		"error",
		"warn",
		"hint",
	},
	symbols = {
		error = " ",
		warn = " ",
		hint = " ",
		info = " ",
	},
	colored = true,
	always_visible = false,
}

local filetype = {
	"filetype",
	icons_enabled = true,
}

local location = {
	"location",
	padding = 0,
}

local custom_icons = {
	function()
		return ""
	end,
	separator = { left = "" },
}

local modes = {
	"mode",
	separator = { left = "", right = "" },
}

local branch = {
	"branch",
	icon = "",
	color = { bg = "#242735", fg = "#c296eb" },
	separator = { left = "", right = "" },
}

function M.config()
	local status, lualine = pcall(require, "lualine")
	if not status then
		return
	end

	lualine.setup({
		options = {
			globalstatus = true,
			icons_enabled = true,
			theme = "tokyonight",
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = { "alpha", "dashboard" },
			always_divide_middle = true,
		},
		sections = {
			lualine_a = {
				custom_icons,
				modes,
			},
			lualine_b = {},
			lualine_c = {
				{
					"filetype",
					icon_only = true,
					colored = true,
				},
				{
					"filename",
				},
				branch,
				diff,
				{
					function()
						return ""
					end,
					color = { bg = "#8FCDA9", fg = "#121319" },
					separator = { left = "", right = "" },
				},
				diagnostics,
			},
			lualine_x = {
				{
					function()
						return ""
					end,
					separator = { left = "", right = "" },
					color = { bg = "#C296EB", fg = "#000000" },
				},
				"progress",
				{
					function()
						return ""
					end,
					separator = { left = "", right = "" },
					color = { bg = "#ECD3A0", fg = "#000000" },
				},
				{
					"location",
				},
				{
					function()
						return ""
					end,
					separator = { left = "", right = "" },
					color = { bg = "#86AAEC", fg = "#000000" },
				},
			},
			lualine_y = {},
			lualine_z = {},
		},
	})

end

return M
