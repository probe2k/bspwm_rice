local config = {}

function config.autopairs()
	local has_autopairs, autopairs = pcall(require, 'nvim-autopairs')
	if not has_autopairs then
		print('autopairs not loaded')

		local loader = require('utils.helper').loader
		loader('nvim-autopairs')
		has_autopairs, autopairs = pcall(require, 'nvim-autopairs')
		if not has_autopairs then
			print('autopairs not installed')
			return
		end
	end

	local npairs = require('nvim-autopairs')
	local Rule = require('nvim-autopairs.rule')
	npairs.setup({
		disable_filetype = { 'TelescopePrompt' },
		autopairs = { enable = true },
    ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], '%s+', ''),
		enable_check_bracket_line = false,
		html_break_line_filetype = {
			'html',
			'vue',
			'typescriptreact',
			'svelte',
			'javascriptreact',
		},
		check_ts = true,
		ts_config = {
			lua = { 'string' },
			javascript = { 'template_string' },
			java = false,
		},
	})

	local ts_conds = require('nvim-autopairs.ts-conds')
	npairs.add_rules({
		Rule(' ', ' '):with_pair(function(opts)
			local pair = opts.line:sub(opts.col - 1, opts.col)
			return vim.tbl_contains({ '()', '[]', '{}' }, pair)
		end),
		Rule('(', ')'):with_pair(function(opts)
			return opts.prev_char:match('.%)') ~= nil
		end):use_key(')'),
		Rule('{', '}'):with_pair(function(opts)
			return opts.prev_char:match('.%}') ~= nil
		end):use_key('}'),
		Rule('[', ']'):with_pair(function(opts)
			return opts.prev_char:match('.%]') ~= nil
		end):use_key(']'),
		Rule('%', '%', 'lua') -- press % => %% is only inside comment or string
		:with_pair(ts_conds.is_ts_node({ 'string', 'comment' })),
		Rule('$', '$', 'lua'):with_pair(ts_conds.is_not_ts_node({ 'function' })),
	})
end

function config.hexokinase()
	vim.g.Hexokinase_optInPatterns = {
    'full_hex',
    'triple_hex',
    'rgb',
    'rgba',
    'hsl',
    'hsla',
    'colour_names',
	}
  vim.g.Hexokinase_highlighters = {
    'virtual',
    'sign_column', -- 'background',
    'backgroundfull',
    -- 'foreground',
    -- 'foregroundfull'
  }
	vim.cmd 'HexokinaseTurnOn'
end

return config
