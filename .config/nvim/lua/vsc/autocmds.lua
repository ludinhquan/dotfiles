vim.api.nvim_create_user_command("ReloadConfig", function()
	vim.cmd("source $MYVIMRC")
	vim.notify("Neovim config reloaded!", vim.log.levels.INFO)
end, {})
