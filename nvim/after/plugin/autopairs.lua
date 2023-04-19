-- Auto Closing Brackets

-- Protected Call
local status, autopairs = pcall(require, "nvim-autopairs")
if not status then
  return
end

-- Autopairs Setup
autopairs.setup({
  check_ts = true,
  ts_config = {
    lua = { "string" },
    javascript = { "template_string" },
    java = false
  }
})

require("cmp").event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
