require("lspsaga").setup({
	finder = {
		max_height = 0.6,
		keys = {
			vsplit = { "i", "s" },
			quit = { "<ESC>" },
		},
	},
	rename = {
		in_select = false,
		keys = {
			quit = { "<ESC>" },
		},
	},
	code_action = {
		keys = {
			quit = { "<ESC>" },
		},
	},
	diagnostic = {
		keys = {
			quit = { "<ESC>" },
		},
	},
})

vim.diagnostic.config({
	virtual_text = false,
})
