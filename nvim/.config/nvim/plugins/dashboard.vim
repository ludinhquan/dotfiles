lua <<EOF
  local HOME = os.getenv('HOME')
  local db = require('dashboard')

  db.preview_command = 'cat | lolcat -F 0.3'
  db.preview_file_path = HOME .. '/.config/nvim/static/neovim.cat'

  db.preview_file_height = 10 
  db.preview_file_width = 70
  db.custom_center = {
      {icon = '  ',
      desc = 'Find  File                              ',
      action = 'Files',
      shortcut = 'SPC p'},
      {icon = '  ',
      desc = 'Find  word                              ',
      action = 'Rg',
      shortcut = 'SPC f'},
    }
  db.custom_footer = {
      \ 'Magic. Do not touch;'
      \ }

  require("core.autocmds").define_augroups {
    _dashboard = {
      -- seems to be nobuflisted that makes my stuff disappear will do more testing
      {
        "FileType",
        "dashboard",
        "setlocal nocursorline noswapfile synmaxcol& signcolumn=no norelativenumber nocursorcolumn nospell  nolist  nonumber bufhidden=wipe colorcolumn= foldcolumn=0 matchpairs= ",
      },
      {
        "FileType",
        "dashboard",
        "set showtabline=0 | autocmd BufLeave <buffer> set showtabline=" .. vim.opt.showtabline._value,
      },
      { "FileType", "dashboard", "nnoremap <silent> <buffer> q :q<CR>" },
    }
  }
 
EOF

