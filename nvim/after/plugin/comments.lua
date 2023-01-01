-- Comments Plugin Pcall
local status_ok, comment = pcall(require, 'Comment')
if not status_ok then
  return
end

comment.setup {
  pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()
}

-- Keybindings
local api = require('Comment.api')
local opts = { silent = true }
vim.keymap.set('n', '<leader>c', function() api.toggle.linewise() end, opts)
vim.keymap.set('v', '<leader>c', function() api.toggle.linewise() end, opts)
vim.keymap.set('x', '<leader>c', function() api.toggle.linewise() end, opts)
