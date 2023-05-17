-- Custom Keymap Settings

-- Local Variables
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader Key Space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal Mode Keymaps

-- Clear file highlighting
keymap("n", "<leader>l", ":nohl<CR>", opts)

-- Join Alterations
keymap("n", "J", "mzJ`z", opts)

-- Centrally Planned Motion
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- Register shenanigans 
keymap("n", "<leader>y", '"+y', opts)
keymap("n", "<leader>Y", '"+Y', opts)
keymap("n", "x", '"_x', opts)
keymap("n", "s", '"_s', opts)
keymap("n", "<leader>d", '"_d', opts)
keymap("n", "<leader>p", '"+p', opts)

-- Buffer controls
keymap("n", "<leader>bq", ":bw<CR>", opts)
keymap("n", "<Tab>", ":bnext<CR>", opts)
keymap("n", "<S-Tab>", ":bprevious<CR>", opts)

-- Resize splits
keymap("n", "<leader>rh", ":vertical resize -2<CR>", opts)
keymap("n", "<leader>rj", ":resize -2<CR>", opts)
keymap("n", "<leader>rk", ":resize +2<CR>", opts)
keymap("n", "<leader>rl", ":vertical resize +2<CR>", opts)

-- Insert Mode Keymaps

-- Disable Vim's built in autocompletion
keymap("i", "<C-n>", "<nop>", opts)
keymap("i", "<C-p>", "<nop>", opts)

-- I'm a clown
keymap("i", "<C-c>", "<Esc>", opts)

-- Visual Mode Keymaps

-- Stay in Visual Mode while indenting
keymap("v", ">", ">gv", opts)
keymap("v", "<", "<gv", opts)

-- Visual Mode move selected area
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Paste over word without copying the word
keymap("x", "<leader>p", "p", opts)
keymap("x", "p", '"_dP', opts)

-- Register shenanigans
keymap("v", "<leader>y", '"+y', opts)
keymap("v", "<leader>d", '"_d', opts)
