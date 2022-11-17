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

-- Call Mason-Lspconfig
require('mason-lspconfig').setup({
  ensure_installed = {
    'sumneko_lua'
  }
})

-- Protexted Call Lspconfig
-- local lspconfig_status_ok, lspconfig = pcall(require, 'lspconfig')
-- if not lspconfig_status_ok then
  -- return
-- end

-- Setup Lua LSP
require 'lspconfig'.sumneko_lua.setup{
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
}
