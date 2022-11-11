-- Options for NeoVim
-- Variable o set to vim.opt
local o = vim.opt

-- Options, alphabetical order
o.autoindent = true -- Auto Indent based on previous lines
o.background = 'dark' -- Background dark colors
o.backup = false -- Doesn't create backup
o.clipboard = 'unnamedplus' -- Copy-paste outside of Vim
o.confirm = true -- Ask to write if :q or :e
o.expandtab = true -- Expands tabs to spaces
o.guicursor = ""
o.hlsearch = true -- Highlight search results
o.ignorecase = true -- Case insensitive search result
o.mouse = 'a' -- Mouse support
o.number = true -- Line numbers
o.path:append { '**' } -- :find recursivly
o.relativenumber = true -- Relative line numbers
o.scrolloff = 8 -- 8 lines of scrolling with cursor
o.shiftwidth = 4 -- 2 space indents
o.shortmess:append 'c'
-- o.signcolumn = 'yes' -- Sign column something I don't like at the moment
o.smartcase = true -- Smart case while searching
o.smartindent = true -- Smarter indentation
o.splitbelow = true -- Horizontal split defaults below
o.splitright = true -- Vertical split defaults right
o.swapfile = false -- No more annoying swap files
o.tabstop = 4 -- 2 space tabs
-- o.termguicolors = true -- Terminal colors
o.timeoutlen = 500 -- Shorter wait time
o.undofile = true -- Undo persistance across files
o.updatetime = 300 -- Faster something
o.wrap = false -- Long lines continue into nothingness
