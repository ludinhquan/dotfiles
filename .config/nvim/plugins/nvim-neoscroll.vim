lua << EOF
  local status_ok, neoscroll = pcall(require, "neoscroll")
  if not status_ok then
    print "Failed to load neoscroll"
    return
  end
  local t = {}
  t['<C-u>'] = {'scroll', {'-vim.wo.scroll', 'true', '250'}}
  t['<C-d>'] = {'scroll', { 'vim.wo.scroll', 'true', '250'}}
  t['<C-b>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '450'}}
  t['<C-f>'] = {'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '450'}}
  t['<C-y>'] = {'scroll', {'-0.10', 'false', '100'}}
  t['<C-e>'] = {'scroll', { '0.10', 'false', '100'}}
  t['zt']    = {'zt', {'250'}}
  t['zz']    = {'zz', {'250'}}
  t['zb']    = {'zb', {'250'}}
  neoscroll.setup({})
  require('neoscroll.config').set_mappings(t)
EOF
