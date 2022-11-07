-- Plugin Configuration
-- Local Variable for Convenience
local fn = vim.fn

-- Auto Install Packer (when not installed)
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  }
  print 'Installing packer close and reopen Nvim ... '
  vim.cmd [[packadd packer.nvim]]
end

-- Protected Call
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- Install Plugins
return packer.startup(function(use)
  -- Core Plugins
  use 'wbthomason/packer.nvim' -- Actual Package Manager
  use 'nvim-lua/popup.nvim' -- Popup API
  use 'nvim-lua/plenary.nvim' -- Dependency for Many Plugins
  
  -- CMP
  use 'hrsh7th/nvim-cmp' -- Completion Plugin
  use 'hrsh7th/cmp-buffer' -- Completion from Open Buffers
  use 'hrsh7th/cmp-path' -- Path/Directory Name Completion 
  use 'hrsh7th/cmp-cmdline' -- Completion in Command Mode
  use 'hrsh7th/cmp-nvim-lsp' -- LSP Completion Support

  -- LSP
  use 'neovim/nvim-lspconfig' -- LSP Enable
  use 'williamboman/nvim-lsp-installer' -- LSP Install Plugin
  
  -- Setup Config After Cloning Packer
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
