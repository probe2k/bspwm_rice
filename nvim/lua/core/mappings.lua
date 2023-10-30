local map = vim.keymap.set

local function load_mappings()
	local maps = {
		['<Tab>']			= ':bnext!<CR>',
		['<S-Tab>']		= ':bprevious!<CR>',
		['<Del>']			= ':bdelete<CR>',
		['<S-Del>']		= ':bdelete!<CR>',
		['<C-a>']			= ':badd ',
		['<C-z>']			= ':NvimTreeToggle<CR>',
		['<C-j>']			= '<C-W><C-J>',
		['<C-k>']			= '<C-W><C-K>',
		['<C-l>']			= '<C-W><C-L>',
		['<C-h>']			= '<C-W><C-H>',
		['<A-->']			= '<C-W><C-<>',
		['<A-=>']			= '<C-W><C->>',
		['<A-Down>']	= '<C-W><C-+>',
		['<A-Up>']		= '<C-W><C-->',
		['<Esc>']			= ':noh<CR>',
		['<C-d>']			= '<C-d>zz',
		['<C-u>']			= '<C-u>zz',
		['<leader>f']	= ':Telescope find_files<CR>',
		['<leader>b']	= ':Telescope buffers<CR>',
		['<C-\\>']		= ':ToggleTerm<CR>',
		['<leader>l']	= ':Lazy<CR>',
	}

	for name, value in pairs(maps) do
		map('n', name, value)
	end
end

load_mappings()
