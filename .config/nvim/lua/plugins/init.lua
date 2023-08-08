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
  { 'neoclide/coc.nvim', branch = 'release' },
  {
    'romgrk/barbar.nvim',
    event = 'VeryLazy',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    init = function()
      require('core.utils').load_mappings 'barbar'
    end,
  },
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
  {
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
    'numToStr/Comment.nvim',
    event = 'VeryLazy',
    opts = function()
      return require 'plugins.configs.comment'
    end,
    config = function(_, opts)
      require('Comment').setup(opts)
      require('Comment.ft').set('ship', '#%s')
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
    opts = function()
      return require 'plugins.configs.autopairs'
    end,
    config = function(_, opts)
      require('nvim-autopairs').setup(opts)
    end,
  },
  {
    'karb94/neoscroll.nvim',
    config = function(_, _)
      require('plugins.configs.neoscroll')
    end,
  },
  {
    'simeji/winresizer',
    init = function()
      require('core.utils').load_mappings 'resize'
    end,
  },
  {
    'mg979/vim-visual-multi',
    branch = 'master'
  },
  {
    'javiorfo/nvim-ship',
    lazy = true,
    ft = 'ship',
    cmd = { "ShipCreate", "ShipCreateEnv" },
    init = function()
      require('core.utils').load_mappings 'nvimship'
    end,
    dependencies = { 'javiorfo/nvim-spinetta', 'javiorfo/nvim-popcorn' },
    opts = function()
      return require 'plugins.configs.nvimship'
    end,
    config = function(_, opts)
      return require('ship').setup(opts)
    end
  },
  {
    'prisma/vim-prisma',
    ft = 'prisma',
    event = 'VeryLazy'
  }
}

require('lazy').setup(plugins, {})
