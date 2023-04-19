-- Neovim Options

-- Local Variable
local o = vim.opt

-- Line Numbers
o.number = true
o.relativenumber = true

-- Global Tab Settings
o.expandtab = true
o.autoindent = true
o.smartindent = true

-- Search Settings
o.ignorecase = true
o.smartcase = true
o.hlsearch = true
o.incsearch = true

-- Appearance
o.cursorline = true
o.termguicolors = true
o.background = "dark"
o.signcolumn = "yes"

-- Backups and Swaps
o.backup = false
o.swapfile = false
o.undofile = true

-- Update Times
-- o.timeoutlen = 500
-- o.updatetime = 300

-- Splits
o.splitbelow = true
o.splitright = true

-- Other
o.mouse = 'a'
o.laststatus = 3
o.showmode = false
o.scrolloff = 8
o.wrap = false
