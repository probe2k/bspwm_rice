local options = {
	ensure_installed = {
		'lua-language-server',
		'typescript-language-server',
		'gopls'
	},

	PATH = 'skip',

	ui = {
		icons = {
			package_pending = ' ',
			package_installed = '󰄳 ',
			package_uninstalled = ' 󰚌',
		},
	},

	max_concurrent_installers = 10,
}

return options
