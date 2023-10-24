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

local ft = require("Comment.ft")

ft.set("ship", "#%s")
ft.set("openscad", { "//%s", "/*%s*/" })
ft.set("*", { "#%s", "#%s" })
