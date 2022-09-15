lua <<EOF
  vim.g.loaded = 1
  vim.g.loaded_netrwPlugin = 1

  local status_ok, nvim_tree = pcall(require, "nvim-tree")

  if not status_ok then
    print "Failed to load nvim-tree.lua"
    return
  end

  local lib = require("nvim-tree.lib")
  local api = require("nvim-tree.api")

  local function node_close_custom()
    local node = lib.get_node_at_cursor()
    if not node or node.name == ".." then
      return
    end

    if node.open then
      lib.expand_or_collapse(node)
    else  
      api.node.navigate.parent_close()
    end

  end

  local config = {
    view = {
     adaptive_size = true,
     centralize_selection = true,
     side = "left",
     mappings = {
        list = {
          { key = "<C-e>", action = "" },
          { key = "l", action = "preview" },
          { key = "h", action = "node_close_custom", action_cb=node_close_custom },
        }
      }
    },
    git = {
      ignore = false
    },
    actions = {
      open_file = {
        window_picker = { enable = false }
      }
    },
    renderer = {
      highlight_opened_files = 'name',
      indent_width = 2,
      highlight_git = true,
      indent_markers = {enable = true},
      icons = { show = {git= false} } 
    } 
  }

  nvim_tree.setup(config)
EOF

nnoremap <Leader>e :NvimTreeToggle<CR>
nnoremap <A-s> :NvimTreeFindFile<CR>
