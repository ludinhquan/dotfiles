-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--
lvim.colorscheme = "spacegray"
lvim.leader = "space"
lvim.transparent_window = true
lvim.builtin.terminal.open_mapping = "<space>t"

lvim.keys.normal_mode = {
  ["l"] = "w",
  ["h"] = "b",
  ["L"] = "l",
  ["H"] = "h",
  ["J"] = "mzJ`z",
  ["te"] = "<C-w>T",
  ["<CR>"] = "o",
  ["<C-d>"] = "<C-d>zz",
  ["<C-s>"] = ":w<CR>",
  ["<A-s>"] = ":NvimTreeFindFile<CR>",
  ["<C-j>"] = ":BufferLineCyclePrev<CR>",
  ["<C-k>"] = ":BufferLineCycleNext<CR>",
  ["<C-x>"] = ":BufferKill<CR>",
  ["<C-\\>"] = ":vsplit<CR>",
  ["<Leader>R"] = ":LvimReload<CR>",
-- Rest Nvim Mapping
  ["R"] = "<Plug>RestNvim",
  ["<Leader>u"] = "<Plug>RestNvimPreview",
  ["<Leader>i"] = "<Plug>RestNvimLast",

  ["<ESC><ESC>"] = ":nohlsearch<CR>",
}

lvim.keys.insert_mode = {
  ["jk"] = "<ESC>",
  ["kj"] = "<ESC>",
  ["<C-s>"] = "<ESC>:w<CR>l",
  ["<C-f>"] = "<Right>",
  ["<C-b>"] = "<Left>",
  ["<C-e>"] = "<C-o>$",
  ["<C-a>"] = "<C-o>^",
  ["<C-l>"] = "<Del>",
  ["<C-h>"] = "<Backspace>",
  ["<C-\\>"] = "<ESC>:vsplit<CR>li",
}

lvim.plugins = {
  {
    "rest-nvim/rest.nvim",
    ft = "http", -- lazy-load on filetype
    config = function()
      require("rest-nvim").setup({ })
    end,
  },
}


