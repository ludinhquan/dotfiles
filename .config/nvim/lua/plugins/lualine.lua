local status, lualine = pcall(require, "lualine")
if not status then return end

local opts = {
  disabled_filetypes = {'', 'NvimTree', 'dashboard'}
}

lualine.setup(opts)
