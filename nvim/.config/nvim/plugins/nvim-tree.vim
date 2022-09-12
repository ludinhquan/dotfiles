lua <<EOF
  vim.g.loaded = 1
  vim.g.loaded_netrwPlugin = 1

  local config = {
    view = {
     side = "left",
     width = 40,
     mappings = {
        list = {
          { key = "l", action = "preview" },
          { key = "h", action = "node_close" },
          { key = "<C-e>", action = "" },
        }
      }
    },
    actions = {
      open_file = {
        window_picker = {
          enable = false
          }
        }
      },
    remove_file = {
      close_window = false
      }
  }

  local g = vim.g
  local status_ok, nvim_tree = pcall(require, "nvim-tree")

  if not status_ok then
    print "Failed to load nvim-tree.lua"
    return
  end

  nvim_tree.setup(config)
EOF

nnoremap <Leader>e :NvimTreeToggle<CR>
nnoremap <A-s> :NvimTreeFindFile<CR>
