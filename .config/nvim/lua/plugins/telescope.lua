local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then return end

local status, actions = pcall(require, "telescope.actions")
if not status then return end

telescope.setup({
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--hidden',
    },
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next, -- move to next result
        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
        ["<esc>"] = actions.close,
        ["<C-d>"] = actions.close,
      },
      n = {
        ["<esc>"] = actions.close,
        ["<C-d>"] = actions.close,
      },
    },
  }
})
