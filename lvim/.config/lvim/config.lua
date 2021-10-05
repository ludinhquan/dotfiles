-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.colorscheme = "spacegray"
lvim.transparent_window = true
lvim.leader = "space"

-- keymappings [view all the defaults by pressing <leader>Lk]
vim.cmd([[
  nnoremap <C-s> :w<CR>
  inoremap <C-s> <ESC>:w<CR>li

  nnoremap qq :exit<CR>
  nnoremap <C-\> :vsplit<CR>
  inoremap <C-\> <Esc>:vsplit<CR>
  inoremap <C-v> <Esc>p

  nnoremap <C-h> <C-w>h
  nnoremap <C-l> <C-w>l

  nnoremap <CR> A<CR>

  nnoremap l w
  nnoremap h b
  nnoremap L l
  nnoremap H h

  vnoremap l w
  vnoremap h b
  vnoremap L l
  vnoremap H h

  inoremap <C-f> <Esc>li
  inoremap <C-b> <Left>
  inoremap <C-e> <Esc>$
  inoremap <C-a> <Esc>^
  inoremap <C-l> <Delete>
  inoremap <C-h> <Backspace>
]])

-- add your own keymapping
lvim.keys.normal_mode = {
  ["<Esc>"] = ":nohlsearch<CR>",
  ["<Leader>q"] = ":exit<CR>",
  ["<A-s>"] = ":NvimTreeFindFile<CR>",
}


-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
lvim.builtin.telescope.on_config_done = function()
  local actions = require "telescope.actions"
  -- for input mode
  lvim.builtin.telescope.defaults.mappings.i["<C-j>"] = actions.move_selection_next
  lvim.builtin.telescope.defaults.mappings.i["<C-k>"] = actions.move_selection_previous
  lvim.builtin.telescope.defaults.mappings.i["<C-n>"] = actions.cycle_history_next
  lvim.builtin.telescope.defaults.mappings.i["<Esc>"] = actions.close
  -- for normal mode
  lvim.builtin.telescope.defaults.mappings.n["<C-j>"] = actions.move_selection_next
  lvim.builtin.telescope.defaults.mappings.n["<C-k>"] = actions.move_selection_previous
end

lvim.builtin.which_key.on_config_done = function()
  lvim.builtin.which_key.mappings['f'] = { "<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files<CR>", "Find File" }
end

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.bufferline.active = false
lvim.builtin.which_key.active = false

-- nvim tree custom config
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0
lvim.builtin.nvimtree.hide_dotfiles= 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true


-- Additional Plugins
lvim.plugins = {
    {"folke/tokyonight.nvim"}, {
        "ray-x/lsp_signature.nvim",
        config = function() require"lsp_signature".on_attach() end,
        event = "InsertEnter"
    },
    {
      "karb94/neoscroll.nvim",
      config = function()
        require("user.neoscroll").config()
      end,
    },
    {
      "lukas-reineke/indent-blankline.nvim",
      config = function()
        require "user.blankline"
      end,
    },
    {
      "phaazon/hop.nvim",
      event = "BufRead",
      config = function()
        require "user.hop"
      end,
    },
    {
      "turbio/bracey.vim",
      cmd = {"Bracey", "BracyStop", "BraceyReload", "BraceyEval"},
      run = "npm install --prefix server",
    },
}

