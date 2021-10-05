lua <<EOF
  local status_ok, nvim_rest = pcall(require, "rest-nvim")
  if not status_ok then
    print "Failed to load rest-nvim"
    return
  end

  nvim_rest.setup({ 
      result_split_horizontal = false,
      skip_ssl_verification = true,
      highlight = {
        enabled = true,
      },
      jump_to_request = true,
  })
EOF

nmap R <Plug>RestNvim
nmap <Leader>u <Plug>RestNvimPreview
nmap <Leader>i <Plug>RestNvimLast
