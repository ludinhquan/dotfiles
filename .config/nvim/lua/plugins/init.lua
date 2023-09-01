local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('plugins.configs.floatterm');

local plugins = {
  { 'nvim-lua/plenary.nvim',       lazy = true },
  { 'nvim-tree/nvim-web-devicons', lazy = true },
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('plugins.configs.colorizer')
    end
  },
  {
    'neoclide/coc.nvim',
    branch = 'release',
    config = function ()
      require('plugins.configs.coc')
    end
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
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
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
    'prisma/vim-prisma',
    ft = 'prisma',
    event = 'VeryLazy'
  },
  {
    'rest-nvim/rest.nvim',
    opts = function()
      return require 'plugins.configs.rest'
    end,
    init = function()
      require('core.utils').load_mappings 'rest'
    end,
  },
  {
    'phaazon/hop.nvim',
    init = function()
      require('core.utils').load_mappings 'hop'
    end,
    config = function(_, opts)
      require('plugins.configs.hop')
    end
  },
  {
    'pwntester/octo.nvim',
    cmd = "Octo",
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('plugins.configs.octo')
    end
  },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('plugins.configs.gitsigns')
    end
  }
}

require('lazy').setup(plugins, {})
