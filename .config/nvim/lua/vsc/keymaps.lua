vim.g.mapleader = " "

local keymap = vim.keymap

---------------------
-- General Keymaps ------------------

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

-- VSCode Neovim: Toggle File Explorer
keymap.set("n", "<leader>l", "<cmd>call VSCodeNotify('workbench.view.explorer')<CR>", { noremap = true, silent = true })
-- VSCode Neovim: Reveal current file in Explorer
keymap.set(
	"n",
	"<leader>n",
	"<cmd>call VSCodeNotify('workbench.files.action.showActiveFileInExplorer')<CR>",
	{ noremap = true, silent = true }
)

-- VSCode Neovim mappings
keymap.set(
	"n",
	"<leader>p",
	"<cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>",
	{ noremap = true, silent = true }
)
keymap.set(
	"n",
	"<leader>o",
	"<cmd>call VSCodeNotify('workbench.action.toggleAuxiliaryBar')<CR>",
	{ noremap = true, silent = true }
)
keymap.set(
	"n",
	"<leader>f",
	"<cmd>call VSCodeNotify('workbench.action.findInFiles')<CR>",
	{ noremap = true, silent = true }
)
keymap.set("n", "<leader>gl", "<cmd>call VSCodeNotify('git.viewHistory')<CR>", { noremap = true, silent = true })

-- VSCode Neovim: Keybindings for buffer navigation and closing buffers
keymap.set(
	"n",
	"<C-j>",
	"<cmd>call VSCodeNotify('workbench.action.previousEditor')<CR>",
	{ noremap = true, silent = true }
)
keymap.set("n", "<C-k>", "<cmd>call VSCodeNotify('workbench.action.nextEditor')<CR>", { noremap = true, silent = true })
keymap.set(
	"n",
	"<leader>q",
	"<cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>",
	{ noremap = true, silent = true }
)
keymap.set(
	"n",
	"<C-x>",
	"<cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>",
	{ noremap = true, silent = true }
)
keymap.set(
	"n",
	"<leader>x",
	"<cmd>call VSCodeNotify('workbench.action.closeEditorsToTheLeft')<CR><cmd>call VSCodeNotify('workbench.action.closeEditorsToTheRight')<CR>",
	{ noremap = true, silent = true }
)
