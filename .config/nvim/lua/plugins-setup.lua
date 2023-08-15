local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local status, lazy = pcall(require, "lazy")

if not status then
  return
end

lazy.setup({
  { 'nvim-lua/plenary.nvim' },
  {
    'numToStr/Comment.nvim',
    lazy = false,
    config = function() require('plugins.comment') end
  },

  {
    'nvim-tree/nvim-tree.lua',
    cmd = { 'NvimTreeToggle', 'NvimTreeFindFile' },
    config = function() require('plugins.nvim-tree') end
  },

  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    config = function() require 'plugins.lualine' end
  },

  -- fuzzy finding w/ telescope
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },-- dependency for better sorting performance
  {
    'nvim-telescope/telescope.nvim',
    cmd = "Telescope",
    config = function () require 'plugins.telescope' end
  },

  -- autocompletion
  {
    "hrsh7th/nvim-cmp",
    config = function () require 'plugins.nvim-cmp' end
  }, -- completion plugin
  {"hrsh7th/cmp-buffer"}, -- source for text in buffer
  {"hrsh7th/cmp-path"}, -- source for file system paths

  -- snippets
  {"L3MON4D3/LuaSnip"}, -- snippet engine
  {"saadparwaiz1/cmp_luasnip"}, -- for autocompletion
  {"rafamadriz/friendly-snippets"}, -- useful snippets


  -- managing & installing lsp servers, linters & formatters
  {
    "williamboman/mason.nvim",
    config = function () require 'plugins.lsp.mason' end
  }, -- in charge of managing lsp servers linters & formatters
  {"williamboman/mason-lspconfig.nvim"}, -- bridges gap b/w mason & lspconfig

  -- configuring lsp servers
  {
    "neovim/nvim-lspconfig",
    config = function () require 'plugins.lsp.lspconfig' end
  }, -- easily configure language servers
  {"hrsh7th/cmp-nvim-lsp"}, -- for autocompletion
  {
    "glepnir/lspsaga.nvim",
    config = function () require 'plugins.lsp.lspsaga' end,
    requires = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  }, -- enhanced lsp uis
  {"jose-elias-alvarez/typescript.nvim"}, -- additional functionality for typescript server (e.g. rename file & update imports)
  {"onsails/lspkind.nvim"}, -- vs-code like icons for autocompletion

  -- formatting & linting
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function () require 'plugins.lsp.null-ls' end,
  }, -- configure formatters & linters
  {"jayp0521/mason-null-ls.nvim"}, -- bridges gap b/w mason & null-ls

  -- treesitter configuration
  {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSUpdateSync" },
    config = function () require 'plugins.treesitter' end,
  },
  {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    dependencies = { {'nvim-tree/nvim-web-devicons'}},
    config = function () require 'plugins.dashboard' end,
  },
  {
    'windwp/nvim-autopairs',
    event = 'VeryLazy',
    config = function () require 'plugins.autopairs' end,
  },
  {
    "karb94/neoscroll.nvim",
    config = function () require 'plugins.neoscroll' end,
  },
  {
    'simeji/winresizer',
  },
  {
    'mg979/vim-visual-multi',
    branch = 'master',
    event = 'VeryLazy'
  },
  {
    'javiorfo/nvim-ship',
    ft = 'ship',
    cmd = { "ShipCreate", "ShipCreateEnv" },
    dependencies = { 'javiorfo/nvim-spinetta', 'javiorfo/nvim-popcorn' },
    config = function () require 'plugins.nvim-ship' end,
  },
  {
    'prisma/vim-prisma',
    ft = 'prisma',
    event = 'VeryLazy'
  },
  {
    'romgrk/barbar.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },

  -- git integration
  {
    "lewis6991/gitsigns.nvim",
    config = function () require 'plugins.gitsigns' end,
  }, -- show line modifications on left hand side

  -- colors
  {
    "RRethy/vim-hexokinase",
    build = "make hexokinase",
    init = function () require 'plugins.colorizer' end,
  }
})

require "plugins.float-term"
