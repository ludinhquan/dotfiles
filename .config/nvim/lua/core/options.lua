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

--Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force to select one from the menu
-- shortness: avoid showing extra messages when using completion
-- updatetime: set updatetime for CursorHold
opt.completeopt = { "menuone", "noselect", "noinsert" }
opt.shortmess = vim.opt.shortmess + { c = true }
-- Avoid showing extra messages when using completion
vim.opt.shortmess = vim.opt.shortmess + "c"

local api = vim.api
api.nvim_set_option("updatetime", 300)

-- Commands
local cmd = vim.cmd

-- remove empty sign ~
cmd("set fillchars+=vert:\\ ,eob:\\ ")
