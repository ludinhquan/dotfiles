local status_ok, neoscroll = pcall(require, "neoscroll")
if not status_ok then
  print "Failed to load neoscroll"
  return
end

neoscroll.setup({
  mappings = { '<C-u>', '<C-d>', 'zt', 'zz', 'zb' },
})
