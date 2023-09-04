local actions = require("telescope.actions")

require("telescope").setup({
	defaults = {
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden",
		},
		mappings = {
			i = {
				["<C-j>"] = actions.move_selection_next, -- move to next result
				["<C-k>"] = actions.move_selection_previous, -- move to prev result
				["<esc>"] = actions.close,
				["<C-d>"] = actions.close,
			},
			n = {
				["<esc>"] = actions.close,
				["<C-d>"] = actions.close,
			},
		},
	},
})
