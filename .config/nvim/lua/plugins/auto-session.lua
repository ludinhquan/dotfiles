local auto_session = require("auto-session")

auto_session.setup({
	auto_save_enabled = true,
	auto_session_suppress_dirs = { "~/", "~/Repos/", "~/Downloads", "~/Documents", "~/Desktop/" },
})
