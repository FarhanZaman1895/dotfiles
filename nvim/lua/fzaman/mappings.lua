-- Custom Mappings
-- Local variables for convenience
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Leader Key
keymap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Normal Mode Mappings

-- Navigate Splits
-- keymap('n', '<C-h>', '<C-w>h', opts)
-- keymap('n', '<C-j>', '<C-w>j', opts)
-- keymap('n', '<C-k>', '<C-w>k', opts)
-- keymap('n', '<C-l>', '<C-w>l', opts)

-- Close Splits
-- keymap('n', '<C-q>', '<C-w>q', opts)

-- Resize Splits
keymap('n', '<M-h>', ':vertical resize +2<CR>', opts)
keymap('n', '<M-j>', ':resize -2<CR>', opts)
keymap('n', '<M-k>', ':resize +2<CR>', opts)
keymap('n', '<M-l>', ':vertical resize -2<CR>', opts)

-- Buffer Nav
keymap('n', '<Tab>', ':bnext<CR>', opts)
keymap('n', '<S-Tab>', ':bprevious<CR>', opts)


-- Clear Search Highlighting
keymap('n', '<leader>l', ':noh<CR>', opts)

-- Kill Buffer
keymap('n', '<leader>bq', ':bw<CR>', opts)

-- Insert Mode Mappings

-- Alternate to Esc
-- keymap('i', 'jk', '<ESC>', opts)
-- keymap('i', 'kj', '<ESC>', opts)

-- Visual and Visual Block Mode Mappings

-- Don't Save Paste Text to Register
keymap('v', 'p', '"_dP', opts)

-- Move Visual Mode
keymap('v', 'J', ":m '>+1<CR>gv=gv", opts)
keymap('v', 'K', ":m '<-2<CR>gv=gv", opts)

-- Stay in Visual Mode While Indenting
keymap('v', '>', '>gv', opts)
keymap('v', '<', '<gv', opts)

-- Netrw Mappings
-- Toggle Netrw
keymap('n', '<leader>e', ':Lex 20<CR>', opts)

-- Netrw fix Ctrl L thing
-- Not yet implemented in Lua I think
vim.cmd([[
  augroup netrw_mappings
  autocmd!
  autocmd filetype netrw nnoremap <buffer> <C-l> <C-w>l
  autocmd filetype netrw nmap <buffer> L <CR>
  autocmd filetype netrw nmap <buffer> H -
  augroup END
]])
