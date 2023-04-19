-- Treesitter
-- Primarily used for syntax highlighting and indentation

-- Protected Call
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

-- Treesitter Configuration
treesitter.setup({
  highlight = {
    enable = true
  },
  indent = { enable = true },
  ensure_installed = {
    "lua",
    "bash"
  },
  auto_install = true
})
