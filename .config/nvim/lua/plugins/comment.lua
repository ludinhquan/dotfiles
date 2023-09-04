require("Comment").setup({
	toggler = {
		---Line-comment toggle keymap
		line = "cl",
		---Block-comment toggle keymap
		block = "cb",
	},
	---LHS of operator-pending mappings in NORMAL and VISUAL mode
	opleader = {
		---Line-comment toggle keymap
		line = "cl",
		---Block-comment toggle keymap
		block = "cb",
	},
})
require("Comment.ft").set("ship", "#%s")
