lua << EOF
  local status_ok, autopairs = pcall(require, "nvim-autopairs")
  if not status_ok then
    print "Failed to load nvim-autopairs"
    return
  end
  autopairs.setup {}
EOF
