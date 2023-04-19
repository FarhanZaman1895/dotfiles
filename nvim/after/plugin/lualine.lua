-- Statusline

-- Protected Call
local status, lualine = pcall(require, "lualine")
if not status then
  return
end

-- Config
lualine.setup()
