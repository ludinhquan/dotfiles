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
		show_code_action = true,
		show_source = true,
		jump_num_shortcut = true,
		max_width = 0.7,
		max_height = 0.6,
		text_hl_follow = true,
		border_follow = true,
		extend_relatedInformation = false,
		diagnostic_only_current = false,
		keys = {
			exec_action = "o",
			quit = "q",
			toggle_or_jump = "<CR>",
			quit_in_show = { "q", "<ESC>" },
		},
	},
	ui = {
		border = "rounded",
		devicon = true,
		title = true,
		expand = "⊞",
		collapse = "⊟",
		code_action = "💡",
		diagnostic = "🔎",
		incoming = " ",
		outgoing = " ",
		hover = " ",
		kind = {},
	},
})

vim.diagnostic.config({
	virtual_text = false, -- Enable virtual text
	signs = true, -- Show signs in the sign column
	underline = true, -- Underline the text
	update_in_insert = false, -- Don't update diagnostics in insert mode
	severity_sort = true, -- Sort diagnostics by severity
	float = {
		border = "rounded",
		source = "if_many",
		header = "",
		prefix = "",
	},
})
