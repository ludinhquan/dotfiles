-- Set leader key
vim.g.mapleader = " "

-- open config
vim.cmd("nmap <leader>c :e ~/.config/nvim/init.lua<cr>")

local keymap = vim.keymap

--[[
    GENERAL KEYMAPS
    - Basic navigation and editing
    - File operations
    - Cursor movement
    - Indentation
    - Insert mode navigation
    - Tab management
]]

-- Basic navigation and editing
keymap.set("n", "x", '"_x')
keymap.set("n", "D", "dd")
-- paste without overwriting
keymap.set("v", "p", "P")
keymap.set("n", "<ESC>", "<cmd> nohlsearch <CR>")

-- Cursor movement (remapped)
keymap.set("n", "l", "w")
keymap.set("n", "h", "b")
keymap.set("n", "L", "l")
keymap.set("n", "H", "h")
keymap.set("v", "l", "w")
keymap.set("v", "h", "b")
keymap.set("v", "L", "l")
keymap.set("v", "H", "h")

-- Indentation
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")
keymap.set("n", "J", "mzJ`z")

-- Insert mode navigation
keymap.set("i", "<C-f>", "<Right>")
keymap.set("i", "<C-b>", "<Left>")
keymap.set("i", "<C-e>", "<C-o>$")
keymap.set("i", "<C-a>", "<C-o>^")
keymap.set("i", "<C-l>", "<Del>")
keymap.set("i", "<C-h>", "<Backspace>")

--[[
    VSCODE-SPECIFIC KEYMAPS
    All VSCode commands are grouped here at the bottom of the file
    1. Window Management
    2. Editor Layout & Navigation
    3. File Explorer
    4. Quick Actions
    5. Buffer Management
    6. LSP & Diagnostics
    7. AI Features
    8. Conditional Commands
]]

-- 1. Window Management
keymap.set(
	"n",
	"<C-h>",
	"<cmd>call VSCodeNotify('workbench.action.focusLeftGroup')<CR>",
	{ noremap = true, silent = true }
)
keymap.set(
	"n",
	"<C-l>",
	"<cmd>call VSCodeNotify('workbench.action.focusRightGroup')<CR>",
	{ noremap = true, silent = true }
)
keymap.set(
	"n",
	"<leader>[",
	"<cmd>call VSCodeNotify('workbench.action.splitEditor')<CR>",
	{ noremap = true, silent = true }
)
keymap.set(
	"n",
	"<leader>-",
	"<cmd>call VSCodeNotify('workbench.action.splitEditorDown')<CR>",
	{ noremap = true, silent = true }
)
keymap.set(
	"n",
	"<leader>n",
	"<cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>",
	{ noremap = true, silent = true }
)

-- 2. Editor Layout & Navigation
keymap.set("n", "<leader>l", "<cmd>call VSCodeNotify('workbench.view.explorer')<CR>", { noremap = true, silent = true })
keymap.set(
	"n",
	"<leader>e",
	"<cmd>call VSCodeNotify('workbench.files.action.showActiveFileInExplorer')<CR>",
	{ noremap = true, silent = true }
)
keymap.set(
	"n",
	"<leader>m",
	"<cmd>call VSCodeNotify('workbench.action.focusActiveEditorGroup')<CR>",
	{ noremap = true, silent = true }
)

-- 3. Quick Actions
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
keymap.set(
	"n",
	"<leader>rs",
	"<cmd>call VSCodeNotify('workbench.action.reloadWindow')<CR>",
	{ noremap = true, silent = true }
)
keymap.set("n", "cm", "<cmd>call VSCodeNotify('editor.action.commentLine')<CR>", { noremap = true, silent = true })
keymap.set("v", "cm", "<cmd>call VSCodeNotify('editor.action.commentLine')<CR>", { noremap = true, silent = true })
keymap.set("n", "cb", "<cmd>call VSCodeNotify('editor.action.blockComment')<CR>", { noremap = true, silent = true })
keymap.set("v", "cb", "<cmd>call VSCodeNotify('editor.action.blockComment')<CR>", { noremap = true, silent = true })

-- 4. Buffer Management
keymap.set(
	"n",
	"<leader>x",
	"<cmd>call VSCodeNotify('workbench.action.closeEditorsToTheLeft')<CR><cmd>call VSCodeNotify('workbench.action.closeEditorsToTheRight')<CR>",
	{ noremap = true, silent = true }
)
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
	"<C-j>",
	"<cmd>call VSCodeNotify('workbench.action.previousEditor')<CR>",
	{ noremap = true, silent = true }
)
keymap.set("n", "<C-k>", "<cmd>call VSCodeNotify('workbench.action.nextEditor')<CR>", { noremap = true, silent = true })

-- 5. LSP & Diagnostics
keymap.set(
	"n",
	"gi",
	"<cmd>call VSCodeNotify('editor.action.goToImplementation')<CR>",
	{ noremap = true, silent = true }
)
keymap.set(
	"n",
	"gr",
	"<cmd>call VSCodeNotify('editor.action.referenceSearch.trigger')<CR>",
	{ noremap = true, silent = true }
)
keymap.set("n", "<leader>rn", "<cmd>call VSCodeNotify('editor.action.rename')<CR>", { noremap = true, silent = true })
keymap.set(
	"n",
	"[a",
	"<cmd>call VSCodeNotify('editor.action.marker.prevInFiles')<CR>",
	{ noremap = true, silent = true }
)
keymap.set(
	"n",
	"]a",
	"<cmd>call VSCodeNotify('editor.action.marker.nextInFiles')<CR>",
	{ noremap = true, silent = true }
)
keymap.set("n", "dl", "<cmd>call VSCodeNotify('editor.action.marker.this')<CR>", { noremap = true, silent = true })

-- 6. AI Features
keymap.set("n", "N", "<cmd>call VSCodeNotify('aipopup.action.modal.generate')<CR>", { noremap = true, silent = true })
keymap.set(
	"v",
	"M",
	"<cmd>call VSCodeNotify('aipopup.action.addSelectionToModal')<CR>",
	{ noremap = true, silent = true }
)

-- 7. Multiple Cursors
keymap.set(
	"n",
	"<C-n>",
	"<cmd>call VSCodeNotify('editor.action.addSelectionToNextFindMatch')<CR>",
	{ noremap = true, silent = true }
)

-- 8. REST Client
keymap.set("n", "<leader>i", "<cmd>call VSCodeNotify('rest-client.request')<CR>", { noremap = true, silent = true })
keymap.set(
	"n",
	"<leader>t",
	"<cmd>call VSCodeNotify('workbench.action.terminal.toggleTerminal')<CR>",
	{ noremap = true, silent = true }
)
keymap.set("n", "go", "<cmd>call VSCodeNotify('editor.action.openLink')<CR>", { noremap = true, silent = true })
