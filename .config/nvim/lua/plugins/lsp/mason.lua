-- import mason
local mason = require("mason")

-- import mason-lspconfig
local mason_lspconfig = require("mason-lspconfig")

-- import mason-null-ls
local mason_null_ls = require("mason-null-ls")

-- enable mason and configure icons
mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

mason_lspconfig.setup({
	-- list of servers for mason to install
	ensure_installed = {
		"tsserver",
		"lua_ls",
		"rust_analyzer",
		"prismals",
	},
	-- auto-install configured servers (with lspconfig)
	automatic_installation = true, -- not the same as ensure_installed
})

mason_null_ls.setup({
	-- list of formatters & linters for mason to install
	ensure_installed = {
		"stylua", -- lua formatter
		"eslint_d", -- ts/js linter
		"prettierd", -- ts/js formatter
	},
	-- auto-install configured servers (with lspconfig)
	automatic_installation = true,
})
