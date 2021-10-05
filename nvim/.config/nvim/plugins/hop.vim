lua << EOF
  local status_ok, hop = pcall(require, "hop")
  if not status_ok then
    print "Failed to load hop"
    return
  end
  hop.setup()
  vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
  vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
EOF
