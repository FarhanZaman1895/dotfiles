-- Mason for Installing LSP and Linters

-- Protected Calls
local mason_status, mason = pcall(require, "mason")
if not mason_status then
  return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
  return
end

-- Mason Setup
mason.setup({
  ui = {
    border = "rounded",
    width = 0.7,
    height = 0.8
  }
})

mason_lspconfig.setup({
  ensure_installed = {
    "lua_ls"
  }
})
