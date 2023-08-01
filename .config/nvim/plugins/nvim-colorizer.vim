lua <<EOF
  local status_ok, colorizer = pcall(require, "colorizer")
  if not status_ok then
    print "Failed to load colorizer"
    return
  end

  colorizer.setup {}
EOF
