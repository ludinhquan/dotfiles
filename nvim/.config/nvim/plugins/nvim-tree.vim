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
  local renderer = require("nvim-tree.renderer")

  local function node_close()
    local node = lib.get_node_at_cursor()
    if not node or node.name == ".." then
      return
    end

    if node.open then
      lib.expand_or_collapse(node)
      return
    end
    api.node.navigate.parent_close()
  end


  local function node_preview()
    local node = lib.get_node_at_cursor()
    if not node or node.name == ".." then
      return
    end

    if node.open == false then
      api.node.open.edit()
      return
    end

    local has_children = node.nodes and (#node.nodes ~= 0 or node.has_children)
    if has_children == true then
      return
    end

    api.node.open.edit()
  end

  local config = {
    view = {
     adaptive_size = true,
     centralize_selection = true,
     side = "left",
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
      highlight_opened_files = 'icon',
      indent_width = 2,
      highlight_git = true,
      indent_markers = {enable = true},
      icons = { show = {git= false} } 
    }
  }

  nvim_tree.setup(config)
  vim.keymap.set('n', 'l', node_preview)
  vim.keymap.set('n', 'h', node_close)
EOF

nnoremap <Leader>e :NvimTreeToggle<CR>
nnoremap <A-s> :NvimTreeFindFile<CR>
