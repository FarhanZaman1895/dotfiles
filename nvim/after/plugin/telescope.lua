-- Fuzzy Finder

-- Protected Calls
local status, telescope = pcall(require, "telescope")
if not status then
  return
end

-- Variables
local builtin = require("telescope.builtin")
local actions = require("telescope.actions")
local themes = require("telescope.themes")
local opts = { noremap = true, silent = true }

-- Telescope Opening Keybinds
vim.keymap.set("n", "<leader>f", function() builtin.find_files(themes.get_dropdown({ preview = false })) end, opts)
vim.keymap.set("n", "<leader>tg", function() builtin.git_files(themes.get_dropdown({ preview = false })) end, opts)
vim.keymap.set("n", "<leader>ts", function() builtin.live_grep(themes.get_dropdown()) end, opts)
vim.keymap.set("n", "<leader>tb", function() builtin.buffers(themes.get_dropdown()) end, opts)

-- Setup
telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
      },
      n = {
        ["<C-c>"] = actions.close
      }
    }
  }
})

-- Extensions
telescope.load_extension("fzf")
