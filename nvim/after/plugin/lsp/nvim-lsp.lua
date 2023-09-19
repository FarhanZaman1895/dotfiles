-- Language Server Support

-- Protected Calls
local status, lspconfig = pcall(require, "lspconfig")
if not status then
  return
end

--- Local Variables ---

-- Float Settings
local float_settings = {
  focusable = false,
  style = "minimal",
  border = "rounded",
  source = "always",
  header = "",
  prefix = ""
}

-- On Attach
local on_attach = function(client, bufnr)

  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- Keymaps
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover(float_settings) end, opts)
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition({ reuse_win = true }) end, opts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set({ "n", "v" }, "<leader>vc", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>vr", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>vd", vim.lsp.buf.type_definition, opts)
  vim.keymap.set("n", "<leader>vl", function()
    local config = float_settings
    config.scope = "line"
    vim.diagnostic.open_float(0, config)
  end, opts)
end

-- Capabilities
local capabilities = require("cmp_nvim_lsp").default_capabilities()

--- LSP Settings ---

-- Signs
local signs = {
  { name = "DiagnosticSignError", text = " " },
  { name = "DiagnosticSignWarn", text = " " },
  { name = "DiagnosticSignHint", text = " " },
  { name = "DiagnosticSignInfo", text = " " }
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texth1 = sign.name, text = sign.text, numh1 = "" })
end

-- Diagnostics Config
vim.diagnostic.config({
  virtual_text = false,
  signs = { active = signs },
  float = float_settings
})

-- Other Settings
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signatureHelp, { border = "rounded" })

--- LSP Servers ---

-- LuaLS
lspconfig.lua_ls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true
        }
      }
    }
  }
})

lspconfig.pyright.setup({
  capabilities = capabilities,
  on_attach = on_attach
})
