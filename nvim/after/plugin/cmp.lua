-- Require CMP
local cmp_status_ok, cmp = pcall(require, 'cmp')
if not cmp_status_ok then
  return
end

-- LSP Icons
local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

cmp.setup {
  mapping = {
    -- Enter to complete
    ['<CR>'] = cmp.mapping.confirm {
      behaviour = cmp.ConfirmBehavior.Insert,
      select = true
    },
    -- Move down in menu
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item()
    -- ['<Tab>'] = cmp.mapping()
  },
  formatting = {
    fields = { "kind", "abbr", "menu" }
  }
}
