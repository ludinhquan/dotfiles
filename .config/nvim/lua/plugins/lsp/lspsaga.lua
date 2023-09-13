require("lspsaga").setup({
	finder = {
		max_height = 0.6,
		keys = {
			vsplit = { "i", "s" },
			quit = { "q", "<ESC>" },
		},
	},
	rename = {
		in_select = false,
		keys = {
			quit = { "q", "<ESC>" },
		},
	},
	code_action = {
		keys = {
			quit = { "q", "<ESC>" },
		},
	},
	diagnostic = {
		keys = {
			quit = { "q", "<ESC>" },
		},
	},
})

vim.diagnostic.config({
	virtual_text = false,
})
