local map = vim.keymap.set

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

map('n', '<Tab>', ':bnext!<CR>', { desc = 'Next buffer' })
map('n', '<S-Tab>', ':bprevious!<CR>', { desc = 'Previous buffer' })
map('n', '<Del>', ':bdelete<CR>', { desc = 'Delete buffer' })
map('n', '<S-Del>', ':bdelete!<CR>', { desc = 'Force delete buffer' })
map('n', '<C-a>', ':badd ', { desc = 'Add buffer' })
map('n', '<C-z>', ':NvimTreeToggle<CR>', { desc = 'Next buffer' })
map('n', '<C-j>', '<C-W><C-J>', { desc = 'Down Window' })
map('n', '<C-k>', '<C-W><C-K>', { desc = 'Up Window' })
map('n', '<C-l>', '<C-W><C-L>', { desc = 'Right Window' })
map('n', '<C-h>', '<C-W><C-H>', { desc = 'Left Window' })
map('n', '<A-->', '<C-W><C-<>', { desc = 'Resize Small' })
map('n', '<A-=>', '<C-W><C->>', { desc = 'Resize Large' })
map('n', '<A-Down>', '<C-W><C-+>', { desc = 'Resize Down' })
map('n', '<A-Up>', '<C-W><C-->', { desc = 'Resize Up' })
map('n', '<Esc>', ':noh<CR>', { desc = 'Clear Selection' })
map('n', '<C-d>', '<C-d>zz', { desc = 'Center down' })
map('n', '<C-u>', '<C-u>zz', { desc = 'Center up' })
map('n', '<leader>f', ':Telescope find_files<CR>', { desc = 'Telescope File Finder' })
map('n', '<leader>b', ':Telescope buffers<CR>', { desc = 'Telescope Buffer Finder' })
map('n', '<C-\\>', ':ToggleTerm<CR>', { desc = 'Toggle Toggleterm' })
map('n', '<leader>l', ':Lazy<CR>', { desc = 'Launch Lazy' })
