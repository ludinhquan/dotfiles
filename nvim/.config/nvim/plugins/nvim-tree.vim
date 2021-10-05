lua <<EOF
  local nvimtree_config = {
    side = "left",
    width = 30,
    show_icons = {
      git = 0,
      folders = 1,
      files = 1,
      folder_arrows = 1,
      tree_width = 30,
    },
    auto_open = 1,
    auto_close = 1,
    quit_on_open = 0,
    follow = 1,
    hide_dotfiles = 0,
    git_hl = 1,
    root_folder_modifier = ":t",
    tab_open = 0,
    allow_resize = 1,
    lsp_diagnostics = 1,
    auto_ignore_ft = { "startify", "dashboard" },
    disable_window_picker=1,
    icons = {
      default = "",
      symlink = "",
      git = {
        unstaged = "",
        staged = "S",
        unmerged = "",
        renamed = "➜",
        deleted = "",
        untracked = "U",
        ignored = "◌",
      },
      folder = {
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = "",
      },
    },
  }

  local g = vim.g
  local status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
  local tree_cb = nvim_tree_config.nvim_tree_callback

  if not status_ok then
    print "Failed to load nvim-tree.config"
    return
  end

  for opt, val in pairs(nvimtree_config) do
    g["nvim_tree_" .. opt] = val
  end

  if not g.nvim_tree_bindings then
    g.nvim_tree_bindings = {
      { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
      { key = "h", cb = tree_cb "close_node" },
      { key = "v", cb = tree_cb "vsplit" },
    }
  end
EOF

nnoremap <Leader>e :NvimTreeToggle<CR>
nnoremap <A-s> :NvimTreeFindFile<CR>
