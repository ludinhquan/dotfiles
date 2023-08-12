local opt = vim.opt

-- line numbers
opt.number = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

 -- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.swapfile = false
opt.autoread = true
opt.updatetime = 200

opt.iskeyword:append("-")

-- enable persistent undo
opt.undofile = true

-- Commands
local cmd = vim.cmd

-- remove empty sign ~
cmd "set fillchars+=vert:\\ ,eob:\\ "
