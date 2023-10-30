local conf = require('modules.tools.config')

return function(tools)
	tools({
		'plasticboy/vim-markdown',
		ft = 'markdown',
		dependencies = { 'godlygeek/tabular' },
		cmd = { 'Toc' },
		init = conf.markdown,
		lazy = true,
	})

	tools({
		'iamcco/markdown-preview.nvim',
		ft = { 'markdown', 'pandoc.markdown', 'rmd' },
		cmd = { 'MarkdownPreview' },
		init = conf.mkdp,
		lazy = true,
	})

	tools({
		'akinsho/toggleterm.nvim',
		cmd = { 'ToggleTerm', 'TermExec' },
		event = { 'CmdwinEnter', 'CmdlineEnter' },
		config = conf.floaterm,
	})
end
