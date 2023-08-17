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
  { 'norcalli/nvim-colorizer.lua' },
  { 'neoclide/coc.nvim', event = 'VeryLazy', branch = 'release' },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSUpdateSync" },
    opts = function()
      return require 'plugins.configs.treesitter'
    end,
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
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
    config = function(_, opts)
      require('Comment').setup(opts)
    end,
  },
  {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    opts = function()
      return require 'plugins.configs.dashboard'
    end,
    config = function(_, opts)
      require('dashboard').setup(opts)
    end,
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
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
    'windwp/nvim-autopairs',
    event = 'VeryLazy',
    config = function(_, opts) 
      require('nvim-autopairs').setup(opts)
    end,
  },
  { 
    'karb94/neoscroll.nvim',
    event = 'VeryLazy',
    config = function(_, opts) 
      require('plugins.configs.neoscroll')
    end,
  },
  { 
    'rest-nvim/rest.nvim',
    event = 'VeryLazy',
    cmd = {'RestNvim', 'RestNvimPreview', 'RestNvimLast'}, 
    init = function()
      require('core.utils').load_mappings 'rest'
    end,
    opts = function()
      return require 'plugins.configs.rest'
    end,
    config = function(_, opts)
      return require('rest-nvim').setup(opts)
    end,
  },
}

require('lazy').setup(plugins, {})
