local vim = vim
local api = vim.api
local cmd_group = api.nvim_create_augroup('LocalAuGroup', {})

local autocmd = {}

api.nvim_create_autocmd({ 'BufWritePre' }, {
	group = cmd_group,
	pattern = { '/tmp/*', 'COMMIT_EDITMSG', 'MERGE_MSG', '*.tmp', '*.bak' },
	callback = function()
		vim.opt_local.undofile = false
	end,
})

function autocmd.nvim_create_augroups(definitions)
	for group_name, defs in pairs(definitions) do
		local gn = api.nvim_create_augroup('LocalAuGroup' .. group_name, {})
		for _, def in ipairs(defs) do
			local opts = {
				group = gn,
				pattern = def[2],
			}
			if type(def[3]) == 'string' then
				opts.command = def[3]
			else
				opts.callback = def[3]
			end
			if def[4] then
				opts.desc = def[4]
			end
			api.nvim_create_autocmd(vim.split(def[1], ','), opts)
		end
	end
end

function autocmd.load_autocmds()
	local definitions = {
		bufs = {
			{
				'BufWritePost,FileWritePost',
				'*.vim',
				[[ if &l:autoread > 0 | source <afile> | echo 'source ' . bufname('%') | endif]],
			},
			{ 'BufWritePost', '*.sum, *.mod', ':silent :GoModTidy' },
			{ 'FileType', 'css,scss', "let b:prettier_exec_cmd = 'prettier-stylelint'" },
			-- {"FileType","lua","nmap <leader><leader>t <Plug>PlenaryTestFile"};
			{
				'FileType',
				'markdown',
				"let b:prettier_exec_cmd = 'prettier' | let g:prettier#exec_cmd_path = '/usr/local/bin/prettier' | let g:spelunker_check_type = 1",
			},
			-- {"UIEnter", "*", ":silent! :lua require('modules.lang.config').syntax_folding()"},
			{ 'BufReadPre', '*', ":silent! :lua require('modules.lang.config').nvim_treesitter()" },
			-- {"BufWritePre", "*.js,*.rs,*.lua", ":FormatWrite"},
			{ 'BufWritePost', '*', ":silent! :lua require('harpoon.mark').add_file()" },
		},
	}

	autocmd.nvim_create_augroups(definitions)
end

autocmd.load_autocmds()
return autocmd
