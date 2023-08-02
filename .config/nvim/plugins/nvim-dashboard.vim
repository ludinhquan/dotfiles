lua <<EOF
  local status_ok, db = pcall(require, "dashboard")
  if not status_ok then
    print "Failed to load dashboard"
    return
  end

  db.setup({
    theme = 'hyper',
    config = {
      week_header = {
        enable = true,
      },
      project = {
        enable = false,
      },
      packages = {
        enable = false,
      },
      shortcut = {
        {
          icon = ' ',
          desc = 'Files',
          group = 'Function',
          action = ':Files',
          key = 'p',
        },
        {
          icon = ' ',
          desc = 'Words',
          group = 'String',
          action = ':Rg',
          key = 'f',
        }
      },
    },
  })
EOF
