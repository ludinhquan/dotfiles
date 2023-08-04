local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  { 'nvim-lua/plenary.nvim', lazy = true },
  { 'nvim-tree/nvim-web-devicons', lazy = true },
  { 
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSUpdateSync" },
  },
  { 'norcalli/nvim-colorizer.lua' },
  { 'simeji/winresizer', lazy = true }, { 
    'nvim-lualine/lualine.nvim', 
    event = 'VeryLazy',
    opts = function()
      return require 'plugins.configs.lualine'
    end,
  },
  {
    'nvim-tree/nvim-tree.lua',
    cmd = { 'NvimTreeToggle', 'NvimTreeFindFile' },
    init = function()
      require('core.utils').load_mappings 'nvimtree'
    end,
    opts = function()
      return require 'plugins.configs.nvimtree'
    end,
  },
  {
    'romgrk/barbar.nvim',
    event = 'VeryLazy',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    init = function()
      require('core.utils').load_mappings 'barbar'
    end,
  },
  {
    'numToStr/Comment.nvim',
    event = 'VeryLazy',
    init = function()
      require('core.utils').load_mappings 'comment'
    end,
    config = function(_, opts)
      require('Comment').setup(opts)
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    init = function()
      require('core.utils').load_mappings 'telescope'
    end,
    opts = function()
      return require 'plugins.configs.telescope'
    end,
  },
  {
    'williamboman/mason.nvim',
    config = function(_, opts)
      require('mason').setup {}
    end,
  },
  {
    'neovim/nvim-lspconfig',
    config = function(_, opts)
      require('plugins.configs.lspconfig')
    end,
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    },
  },
  -- {'hrsh7th/nvim-cmp'},     -- Required
  -- {'hrsh7th/cmp-nvim-lsp'}, -- Required
  -- {'L3MON4D3/LuaSnip'},     -- Required
}

require('lazy').setup(plugins, {})
