local status, comment = pcall(require, "Comment")
if not status then return end

local opts = {
 toggler = {
    line = 'cl',
    block = 'cb',
  },
  opleader = {
    line = 'cl',
    block = 'cb',
  },
}

comment.setup(opts)

local ft = require('Comment.ft')

-- for nvim ship file (rest api)
ft.set('ship', '#%s')
