vim.g.mapleader = " "

local keymap = vim.keymap

---------------------
-- General Keymaps
---------------------

keymap.set("i", "jk", "<ESC>")
keymap.set("n", "<CR>", "A<CR>")

keymap.set("i", "<C-s>", "<cmd> w <CR>")
keymap.set("n", "<C-s>", "<cmd> w <CR>")
keymap.set("v", "<C-s>", "<cmd> w <CR>")

keymap.set("n", "<leader>q", "<cmd> q <CR>")
keymap.set("n", "<ESC><ESC>", "<cmd> nohlsearch <CR>")

keymap.set("n", "x", '"_x')
keymap.set("n", "D", "dd") -- increase & decrease number

-- window management
keymap.set("n", "<C-\\>", "<cmd> vsplit <CR>") -- split window
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-l>", "<C-w>l")

-- remap cursor move
keymap.set("n", "l", "w")
keymap.set("n", "h", "b")
keymap.set("n", "L", "l")
keymap.set("n", "H", "h")
keymap.set("v", "l", "w")
keymap.set("v", "h", "b")
keymap.set("v", "L", "l")
keymap.set("v", "H", "h")

-- indent without killing the selection in VISUAL mode
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- keep the cursor in place while joining lines
keymap.set("n", "J", "mzJ`z")

-- move cursor in insert mode
keymap.set("i", "<C-f>", "<Right>")
keymap.set("i", "<C-b>", "<Left>")
keymap.set("i", "<C-e>", "<C-o>$")
keymap.set("i", "<C-a>", "<C-o>^")
keymap.set("i", "<C-l>", "<Del>")
keymap.set("i", "<C-h>", "<Backspace>")

-- tabs
keymap.set("n", "<leader>to", "<cmd> tabnew <CR>")
keymap.set("n", "<leader>tx", "<cmd> tabclose <CR>")
keymap.set("n", "<leader>tn", "<cmd> tabn <CR>")
keymap.set("n", "<leader>tp", "<cmd> tabp <CR>")
keymap.set("n", "te", "<C-w>T") -- full tab size

keymap.set("n", "<C-Up>", "<cmd>resize +2<CR>", { silent = true })
keymap.set("n", "<C-Down>", "<cmd>resize -2<CR>", { silent = true })
keymap.set("n", "<C-Right>", "<cmd>vertical resize -2<CR>", { silent = true })
keymap.set("n", "<C-Left>", "<cmd>vertical resize +2<CR>", { silent = true })

-- open browser
keymap.set("n", "go", "<cmd> call netrw#BrowseX(netrw#GX(),netrw#CheckIfRemote(netrw#GX())) <CR>")

-- toggle the 'wrap' option
keymap.set("n", "<leader>;", [[:lua vim.wo.wrap = not vim.wo.wrap<CR>]], { noremap = true, silent = true })

keymap.set("n", "<leader>L", "\"ayiwOconsole.log('<C-R>a:', <C-R>a);<Esc>", { noremap = true, silent = true })
keymap.set("x", "<leader>L", "\"ayOconsole.log('<C-R>a:', <C-R>a);<Esc>", { noremap = true, silent = true })

----------------------
-- Plugin Keybinds
----------------------

-- nvimtree
keymap.set("n", "<leader>l", "<cmd> NvimTreeToggle <CR>")
keymap.set("n", "<leader>n", "<cmd> NvimTreeFindFile <CR>")

-- dadbodui
keymap.set("n", "<leader>b", "<cmd> DBUIToggle <cr>")

-- fzf
keymap.set("n", "<leader>p", "<cmd>lua require('fzf-lua').files()<CR>")
keymap.set("n", "<leader>s", "<cmd>lua require('fzf-lua').lgrep_curbuf()<CR>")
keymap.set("n", "<leader>f", "<cmd>lua require('fzf-lua').live_grep_native()<CR>")
keymap.set("n", "<leader>gl", "<cmd>lua require('fzf-lua').git_bcommits()<CR>")

-- barbar
keymap.set("n", "<C-j>", "<cmd> BufferPrevious <cr>")
keymap.set("n", "<C-k>", "<cmd> BufferNext <cr>")
keymap.set("n", "<C-x>", "<cmd> BufferClose <cr>")
keymap.set("n", "<leader>x", "<cmd> BufferCloseAllButCurrent <cr>")

-- resize
keymap.set("n", "<leader>e", "<cmd> WinResizerStartResize <cr>")

-- search character
keymap.set("n", "m", "<cmd> HopChar2 <cr>")

-- session
keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" }) -- restore last workspace session for current directory
keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" }) -- save workspace session for current working directory

-- -- rest api
keymap.set("n", "R", "<cmd> Rest run <CR>")
keymap.set("n", "<leader>u", "<cmd> Rest open <cr>")
keymap.set("n", "<leader>i", "<cmd> Rest last <cr>")

-- Avante
keymap.set("n", "<leader>od", "<cmd> AvanteSwitchProvider deepseek <CR>")
keymap.set("n", "<leader>oc", "<cmd> AvanteSwitchProvider claude <CR>")
keymap.set("n", "<leader>oo", "<cmd> AvanteSwitchProvider openai <CR>")

-- Winresizer
keymap.set("n", ";;", "<cmd> WinResizerStartResize <CR>")
