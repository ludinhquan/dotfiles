local M = {}

M.mappings = {
  nvimtree = {
    plugin = true,
    n = {
      ["<C-f>"] = { "<cmd> NvimTreeFindFile <CR>", "Find file nvimtree" },
      ["<A-s>"] = { "<cmd> NvimTreeFindFile <CR>", "Find file nvimtree" },
      ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
    },
  }
}

return M
