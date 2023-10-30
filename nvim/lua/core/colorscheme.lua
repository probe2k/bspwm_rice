local loading_theme = 'catppuccin'

lprint('loading theme...')

local function load_colorscheme(theme)
	if not theme then
		theme = loading_theme
	end
	require('lazy').load({ plugins = { theme } })
end

return {
	load_colorscheme = load_colorscheme,
	current_theme = loading_theme,
}
