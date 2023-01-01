--- MASON ---
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
    'sumneko_lua',
    'omnisharp'
  }
})

--- LSP Setup and Config ---
local lsp = {}

-- Float Settings
local float_settings = {
  focusable = false,
  style = 'minimal',
  border = 'rounded',
  source = 'always',
  header = '',
  prefix = ''
}

lsp.setup = function()
  -- Change LSP signs
  local signs = {
    { name = 'DiagnosticSignError', text = ' ' },
    { name = 'DiagnosticSignWarn', text = ' ' },
    { name = 'DiagnosticSignHint', text = ' ' },
    { name = 'DiagnosticSignInfo', text = ' ' }
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texth1 = sign.name, text = sign.text, numh1 = ''})
  end

  -- General LSP Settings
  local settings = {
    virtual_text = false,
    signs = { active = signs },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = float_settings
  }

  vim.diagnostic.config(settings)

  -- For Hover
  vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = 'rounded'
  })

  -- For Help
  vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = 'rounded'
  })
end

lsp.setup()

lsp.on_attach = function(client, bufnr)
  -- Options for Keybinds
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- Hover
  vim.keymap.set('n', 'K', function() vim.lsp.buf.hover(float_settings) end, opts)

  -- Go to Definition or Declaration
  vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition({ reuse_win = true }) end, opts)
  vim.keymap.set('n', '<leader>vd', function() vim.lsp.buf.declaration({ reuse_win = true }) end, opts)

  -- References
  -- vim.keymap.set('n', '<leader>vr', function() vim.lsp.buf.references() end, opts)

  -- Diagnostics
  vim.keymap.set('n', '<leader>vl', function()
    local config = float_settings
    config.scope = 'line'
    vim.diagnostic.open_float(0, config)
  end, opts)
end

-- LSP Protected Call
local lspconfig_status_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_status_ok then
  return
end

-- Setup Lua LSP
lspconfig.sumneko_lua.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }, on_attach = lsp.on_attach
}

-- Setup C# LSP
lspconfig.omnisharp.setup {
  on_attach = lsp.on_attach
}

-- Setup JS/TS 
lspconfig.tsserver.setup {
  on_attach = lsp.on_attach
}
