nnoremap <Tab> : bnext!<CR>
nnoremap <S-Tab> : bprevious!<CR>
nnoremap <Del> : bdelete<CR>
nnoremap <S-Del> : bdelete!<CR>
nnoremap <C-n> : execute ":buffer ".(bufnr("%") + 1)<CR>
nnoremap <C-p> : execute ":buffer ".(bufnr("%") - 1)<CR>
nnoremap <C-a> : badd
nnoremap <C-k> : NERDTree<CR>
nnoremap <C-Down> <C-W><C-J>
nnoremap <C-Up> <C-W><C-K>
nnoremap <C-Right> <C-W><C-L>
nnoremap <C-Left> <C-W><C-H>
nnoremap <A--> <C-W><C-<>
nnoremap <A-=> <C-W><C->>
nnoremap <A-Down> <C-W><C-+>
nnoremap <A-Up> <C-W><C-->
nnoremap \ :noh<return>
