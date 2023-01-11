-- Options for NeoVim
-- Variable o set to vim.optoptions
local o = vim.opt

-- Options, alphabetical order
o.autoindent = true -- Auto Indent based on previous lines
o.background = 'dark' -- Background dark colors
o.backup = false -- Doesn't create backup
o.clipboard = 'unnamedplus' -- Copy-paste outside of Vim
o.confirm = true -- Ask to write if :q or :e
o.cursorline = true -- Cursor line looks good with color scheme
o.expandtab = true -- Expands tabs to spaces
o.hlsearch = true -- Highlight search results
o.incsearch = true -- Highlight search while typing
o.ignorecase = true -- Case insensitive search result
o.laststatus = 3
o.mouse = 'a' -- Mouse support
o.number = true -- Line numbers
o.relativenumber = true -- Relative line numbers
o.scrolloff = 8 -- 8 lines of scrolling with cursor
o.shiftwidth = 2 -- 2 space indents
o.shortmess:append 'c' -- Idk 
o.showmode = false
o.signcolumn = 'yes' -- Sign column something works better with color scheme
o.smartcase = true -- Smart case while searching
o.smartindent = true -- Smarter indentation
o.splitbelow = true -- Horizontal split defaults below
o.splitright = true -- Vertical split defaults right
o.swapfile = false -- No more annoying swap files
o.tabstop = 2 -- 2 space tabs
-- o.termguicolors = true -- Terminal colors
o.timeoutlen = 500 -- Shorter wait time
o.undofile = true -- Undo persistance across files
o.updatetime = 300 -- Faster something
o.wrap = false -- Long lines continue into nothingness

-- Netrw options
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = 20

vim.cmd([[
  augroup netrw_hidden_buffers
  au!
  au filetype netrw setlocal bufhidden=wipe
  augroup END
]])
