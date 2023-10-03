require("fzf-lua").setup({
	fzf_opts = { ["--layout"] = "default", ["--marker"] = "+" },
	winopts = {
		width = 0.8,
		height = 0.9,
		preview = {
			hidden = "nohidden",
			vertical = "up:45%",
			horizontal = "right:50%",
			layout = "flex",
			flip_columns = 120,
		},
	},
})
