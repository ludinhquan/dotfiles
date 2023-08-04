local M = {}

M.mappings = {
  nvimtree = {
    n = {
      ["<C-f>"] = { "<cmd> NvimTreeFindFile <CR>", "Find file nvimtree" },
      ["<A-s>"] = { "<cmd> NvimTreeFindFile <CR>", "Find file nvimtree" },
      ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
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
  comment = {
    n = {
      ["<Leader>/"] = { "<cmd> CommentToggle <CR>", "Comment block" },
    },
    v = {
      ["<Leader>/"] = { "<cmd> CommentToggle <CR>", "Comment block" },
    },
  },
  telescope = {
    n = {
      ["<Leader>p"] = { "<cmd> Telescope find_files hidden=true<CR>", "Find files" },
      ["<Leader>f"] = { "<cmd> Telescope live_grep <CR>", "Find words in current project" },
      ["<Leader>s"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find words in current file" },
    }
  }
}

return M
