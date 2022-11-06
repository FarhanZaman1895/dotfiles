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
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

-- Close Splits
keymap('n', '<C-q>', '<C-w>q', opts)

-- Resize Splits
keymap('n', '<M-h>', ':vertical resize +2<CR>', opts)
keymap('n', '<M-j>', ':resize -2<CR>', opts)
keymap('n', '<M-k>', ':resize +2<CR>', opts)
keymap('n', '<M-l>', ':vertical resize -2<CR>', opts)

-- Netrw Toggle
keymap('n', '<leader>e', ':Lex 30<CR>', opts)

-- Buffer Nav
keymap('n', '<Tab>', ':bnext<CR>', opts)
keymap('n', '<S-Tab>', ':bprevious<CR>', opts)

-- Insert Mode Mappings

-- Alternate to Esc
-- keymap('i', 'jk', '<ESC>', opts)
-- keymap('i', 'kj', '<ESC>', opts)

-- Visual and Visual Block Mode Mappings

-- Don't Save Paste Text to Register
keymap('v', 'p', '"_dP', opts)

-- Stay in Visual Mode While Indenting
keymap('v', '>', '>gv', opts)
keymap('v', '<', '<gv', opts)
keymap('x', '>', '>gv', opts)
keymap('x', '<', '<gv', opts)

-- Move Selection
