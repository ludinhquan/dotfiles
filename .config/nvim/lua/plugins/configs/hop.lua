local status_ok, hop = pcall(require, "hop")
if not status_ok then
  print "Failed to load hop"
  return
end

hop.setup()
