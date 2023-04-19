-- File Explorer

-- Disable NetRW
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Protected Call
local status, nvimtree = pcall(require, "nvim-tree")
if not status then
  return
end

-- Arrow Colour
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#c3e88d ]])

-- Config
nvimtree.setup() 

-- Keybind
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
