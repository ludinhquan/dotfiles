local status, ship = pcall(require, "ship")
if not status then
  return
end

ship.setup {
  request = {
    timeout = 30,
    autosave = true
  },
  response = {
    show_headers = 'all',
    window_type = 'v',
    size = 60,
    redraw = true
  },
  output = {
    save = true,
    override = true,
    folder = "output",
  },
  internal = {
    log_debug = false,
  }
}
