-- Plugin Configuration
-- Local variable for convenience
local fn = vim.fn

-- Auto install packer (when not installed)
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

-- Protected call
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- Install plugins
return packer.startup(function(use)
  -- Core plugins
  use 'wbthomason/packer.nvim' -- Actual package manager
  use 'nvim-lua/popup.nvim' -- Popup API
  use 'nvim-lua/plenary.nvim' -- Dependency for many plugins
  
  -- CMP
  use 'hrsh7th/nvim-cmp' -- Completion plugin
  use 'hrsh7th/cmp-buffer' -- Completion from open buffers
  use 'hrsh7th/cmp-path' -- Path/Directory name completion 
  use 'hrsh7th/cmp-cmdline' -- Completion in command mode
  use 'hrsh7th/cmp-nvim-lsp' -- LSP completion support

  -- LSP
  use 'neovim/nvim-lspconfig' -- LSP enable
  use 'williamboman/mason.nvim' -- LSP installer mason
  use 'williamboman/mason-lspconfig' -- LSP installer support 
  
  -- Setup Config After Cloning Packer
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
