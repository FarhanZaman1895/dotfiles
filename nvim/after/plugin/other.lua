-- Other Plugins
-- Those that don't need as much configuration

--- Nvim Surround ---

-- Protected Call
local surround_status, surround = pcall(require, "nvim-surround")
if not surround_status then
  return
end

-- Config
surround.setup({
  keymaps = {
    normal = "S",
  }
})

-- Comment

--- Protected Call ---
local comment_status, comment = pcall(require, "Comment")
if not comment_status then
  return
end

-- Config
comment.setup()


