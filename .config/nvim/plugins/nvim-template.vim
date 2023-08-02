lua <<EOF
  local status_ok, template = pcall(require, "template")
  if not status_ok then
    print "Failed to load template"
    return
  end

  template.setup {
    temp_dir = '~/.config/nvim/template',
    author = 'ldquan',
    email = 'ludinhquan@gmail.com',
  }
EOF
