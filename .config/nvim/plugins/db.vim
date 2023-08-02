lua <<EOF
  local status_ok, dbconfig = pcall(require, "dbconfig")
  if not status_ok then return end
  vim.g.dbs = dbconfig
EOF

nnoremap <Leader>n :DBUIToggle<CR>

