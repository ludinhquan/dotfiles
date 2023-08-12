local status, dashboard = pcall(require, "dashboard")
if not status then return end

dashboard.setup {
  theme = 'doom',
  config = {
    week_header = {
      enable = true,
    },
    center = {
      {
        icon = ' ',
        desc = 'Find Files',
        group = 'Function',
        action = 'Telescope find_files hidden=true',
        key = 'p',
      },
      {
        icon = ' ',
        desc = 'Find Words',
        group = 'Function',
        action = 'Telescope live_grep',
        key = 'f',
      },
    },
  }
}

