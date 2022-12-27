-- Telescope Protected Call
local telescope_status_op, telescope = pcall(require, 'telescope')
if not telescope_status_op then
  return
end

local builtin = require('telescope.builtin')
local themes = require('telescope.themes')
local actions = require('telescope.actions')

-- Telescope Keybinds
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>f', function() builtin.find_files(themes.get_dropdown({ preview = false })) end, opts)
vim.keymap.set('n', '<leader>lg', function() builtin.live_grep(themes.get_dropdown()) end)

-- Telescope Settings
telescope.setup {
  defaults = {
    path_display = { 'smart' },

    -- Mappings
    mappings = {
      i = {
        ['<C-n>'] = actions.cycle_history_next,
        ['<C-p>'] = actions.cycle_history_prev,
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        ['<C-c>'] = actions.close
      },
      n = {
        ['<C-c>'] = actions.close
      }
    },
  },
  extensions = {
    media_files = {
      filetypes = {'png', 'webp', 'jpg', 'jpeg'},
      find_cmd = 'rg'
    }
  }
}
