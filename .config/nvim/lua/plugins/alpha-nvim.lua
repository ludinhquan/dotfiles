local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.buttons.val = {
	dashboard.button("a", "  > New File", "<cmd>ene<CR>"),
	dashboard.button("e", "  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
	dashboard.button("p", "󰱼 > Find File", "<cmd>Telescope find_files hidden=true<CR>"),
	dashboard.button("f", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
	dashboard.button("w", "󰁯  > Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
	dashboard.button("q", " > Quit NVIM", "<cmd>qa<CR>"),
}
alpha.setup(dashboard.config)

-- Disable folding on alpha buffer
vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
