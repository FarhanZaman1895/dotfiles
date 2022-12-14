local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
  return
end

configs.setup {
  ensure_installed = { 'lua', 'help', 'c', 'c_sharp', 'cpp', 'python' },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  },
  indent = { enable = true, disable = { 'yaml' } },

  -- Rainbow Parenthesis and Brackets
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil
  },
  autopairs = {
    enable = true
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false
  }
}
