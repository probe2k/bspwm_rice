local vim = vim

local M = {}

function M.keys()

	vim.cmd [[ nnoremap <Tab> : bnext!<CR> ]]
	vim.cmd [[ nnoremap <S-Tab> : bprevious!<CR> ]]
	vim.cmd [[ nnoremap <Del> : bdelete<CR> ]]
	vim.cmd [[ nnoremap <S-Del> : bdelete!<CR> ]]
	vim.cmd [[ nnoremap <C-n> : execute ":buffer ".(bufnr("%") + 1)<CR> ]]
	vim.cmd [[ nnoremap <C-p> : execute ":buffer ".(bufnr("%") - 1)<CR> ]]
	vim.cmd [[ nnoremap <C-a> : badd ]]
	vim.cmd [[ nnoremap <C-z> : NERDTreeToggle<CR> ]]
	vim.cmd [[ nnoremap <C-Down> <C-W><C-J> ]]
	vim.cmd [[ nnoremap <C-Up> <C-W><C-K> ]]
	vim.cmd [[ nnoremap <C-Right> <C-W><C-L> ]]
	vim.cmd [[ nnoremap <C-Left> <C-W><C-H> ]]
	vim.cmd [[ nnoremap <A--> <C-W><C-<> ]]
	vim.cmd [[ nnoremap <A-=> <C-W><C->> ]]
	vim.cmd [[ nnoremap <A-Down> <C-W><C-+> ]]
	vim.cmd [[ nnoremap <A-Up> <C-W><C--> ]]
	vim.cmd [[ nnoremap \ :noh<return> ]]
	vim.cmd [[ nnoremap "<C-d>" : "<C-d>zz" ]]
	vim.cmd [[ nnoremap "<C-u>" : "<C-u>zz" ]]

end

return M
