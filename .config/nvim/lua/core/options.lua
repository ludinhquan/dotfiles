local M = {}

M.mappings = {
  nvimtree = {
    n = {
      ["<A-s>"] = { "<cmd> NvimTreeFindFile <CR>", "Find file nvimtree" },
      ["<Leader>d"] = { "<cmd> NvimTreeFindFile <CR>", "Find file nvimtree" },
      ["<Leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
    },
  },
  barbar = {
    n = {
      ["<C-j>"] = { "<cmd> BufferPrevious <CR>", "Focus to prev tab" },
      ["<C-k>"] = { "<cmd> BufferNext <CR>", "Focus to next tab" },
      ["<C-x>"] = { "<cmd> BufferClose <CR>", "Close current buffer" },
      ["<Leader>x"] = { "<cmd> BufferCloseAllButCurrent <CR>", "Close all buffer but ignore current" },
    },
  },
  telescope = {
    n = {
      ["<Leader>p"] = { "<cmd> Telescope find_files hidden=true<CR>", "Find files" },
      ["<Leader>f"] = { "<cmd> Telescope live_grep <CR>", "Find words in current project" },
      ["<Leader>s"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find words in current file" },
    }
  },
  rest = {
    n = {
      ["R"] = { "<Plug>RestNvim", "Execute api" },
      ["<Leader>u"] = { "<Plug>RestNvimPreview", "Preview curl" },
      ["<Leader>i"] = { "<Plug>RestNvimLast", "Execute last endpoint" },
    }
  },
}

return M
