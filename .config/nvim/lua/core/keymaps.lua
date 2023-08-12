vim.g.mapleader = " "

local keymap = vim.keymap 

---------------------
-- General Keymaps
---------------------

keymap.set('i', 'jk', '<ESC>')
keymap.set('n', '<CR>', 'A<CR>')

keymap.set('i', '<C-s>', '<cmd> w <CR>')
keymap.set('n', '<C-s>', '<cmd> w <CR>')

keymap.set('n', '<leader>q', '<cmd> q <CR>')
keymap.set('n', '<ESC><ESC>', '<cmd> nohlsearch <CR>')

keymap.set('n', 'x', '"_x')
keymap.set('n', 'D', 'dd')

-- increase & decrease number
keymap.set('n', '<leader>+', '<C-a>')
keymap.set('n', '<leader>-', '<C-x>')

-- split window
keymap.set('n', '<C-\\>', '<cmd> vsplit <CR>') -- split window
keymap.set('n', '<C-h>', '<C-w>h')
keymap.set('n', '<C-l>', '<C-w>l')

-- remap cursor move
keymap.set('n', 'l', 'w')
keymap.set('n', 'h', 'b')
keymap.set('n', 'L', 'l')
keymap.set('n', 'H', 'h')
keymap.set('v', 'l', 'w')
keymap.set('v', 'h', 'b')
keymap.set('v', 'L', 'l')
keymap.set('v', 'H', 'h')

-- indent without killing the selection in VISUAL mode
keymap.set('v', '<', '<gv')
keymap.set('v', '>', '>gv')

-- keep the cursor in place while joining lines
keymap.set('n', 'J', 'mzJ`z')

-- move cursor in insert mode
keymap.set('i', '<C-f>', '<Right>')
keymap.set('i', '<C-b>', '<Left>')
keymap.set('i', '<C-e>', '<C-o>$')
keymap.set('i', '<C-a>', '<C-o>^')
keymap.set('i', '<C-l>', '<Del>')
keymap.set('i', '<C-h>', '<Backspace>')

-- tabs
keymap.set('n', '<leader>to', '<cmd> tabnew <CR>')
keymap.set('n', '<leader>tx', '<cmd> tabclose <CR>')
keymap.set('n', '<leader>tn', '<cmd> tabn <CR>')
keymap.set('n', '<leader>tp', '<cmd> tabp <CR>')
keymap.set('n', 'te', '<C-w>T') -- full tab size

----------------------
-- Plugin Keybinds
----------------------

-- nvimtree
keymap.set('n', '<A-s>', '<cmd> NvimTreeFindFile <CR>')
keymap.set('n', '<leader>e', '<cmd> NvimTreeToggle <CR>')

-- telescope
keymap.set("n", "<leader>p", "<cmd>Telescope find_files hidden=true<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>f", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>s", "<cmd>Telescope current_buffer_fuzzy_find<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>l", "<cmd>find_files search_dirs={'.ships'}<cr>") -- find http request

-- barbar
keymap.set("n", "<C-j>", "<cmd> BufferPrevious <cr>")
keymap.set("n", "<C-k>", "<cmd> BufferNext <cr>")
keymap.set("n", "<C-x>", "<cmd> BufferClose <cr>")
keymap.set("n", "<leader>x", "<cmd> BufferCloseAllButCurrent <cr>")

-- resize
keymap.set("n", "<C-e>", "<cmd> WinResizerStartResize <cr>")

-- nvim ship
keymap.set("n", "R", "<cmd> Ship <cr>")
keymap.set("n", "X", "<cmd> ShipCloseResponse <cr>")
