-- Packer Setup

-- Autoinstall Packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer()

-- Auto update Packer when file write
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Packer Protected Call
local status, packer = pcall(require, "packer")
if not status then
  return
end

-- Packer Setup
return packer.startup(function(use)
  -- Base Plugins
  use("wbthomason/packer.nvim")
  use("nvim-lua/popup.nvim")
  use("nvim-lua/plenary.nvim")

  -- Neovim Tree
  use("nvim-tree/nvim-tree.lua")
  use("nvim-tree/nvim-web-devicons")

  -- Telescope
  use({ "nvim-telescope/telescope.nvim", tag = "0.1.1" })
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

  -- CMP
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("saadparwaiz1/cmp_luasnip")
  use("hrsh7th/cmp-nvim-lsp")

  -- LuaSnip
  use("L3MON4D3/LuaSnip")
  use("rafamadriz/friendly-snippets")

  -- Mason
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")

  -- Nvim LSP Config
  use("neovim/nvim-lspconfig")
  use("onsails/lspkind.nvim")

  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end
  })

  -- Other
  use("folke/tokyonight.nvim")
  use("numToStr/Comment.nvim")
  use({
    "kylechui/nvim-surround",
    tag = "*",
  })
  use("nvim-lualine/lualine.nvim")
  use("windwp/nvim-autopairs")

  if packer_bootstrap then
    require("packer").sync()
  end
end)
