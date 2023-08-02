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
  { 'nvim-tree/nvim-web-devicons', lazy = true },
  { 'norcalli/nvim-colorizer.lua' },
  { 'simeji/winresizer', lazy = true },
  { 
    'nvim-lualine/lualine.nvim', 
    opts = function()
      return require 'plugins.configs.lualine'
    end,
    config = function(_, opts)
      require('lualine').setup(opts)
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
    config = function(_, opts)
      require('nvim-tree').setup(opts)
    end,
  },
}

require('lazy').setup(plugins, {})

-- red
