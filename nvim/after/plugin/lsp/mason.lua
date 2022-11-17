-- Protected Call Mason
local mason_status_ok, mason = pcall(require, 'mason')
if not mason_status_ok then
  return
end

-- Call Mason Setup
mason.setup({
  ui = {
    icons = {
      package_installed = '✓',
      package_pending = '➜',
      package_uninstalled = '✗'
    }
  }
})

-- Protected Call Mason-Lspconfig
local mason_lsp_status_ok, mason-lspconfig = pcall(require, 'mason-lspconfig')
if not mason_lsp_status_ok then
  return
end

-- Call Mason Lspconfig Setup
mason-lspconfig.setup()

-- Protexted Call Lspconfig
local lspconfig_status_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_status_ok then
  return
end
