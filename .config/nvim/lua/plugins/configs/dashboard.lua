local options = {
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

return options
