-- import null-ls plugin
local null_ls = require("null-ls")

local null_ls_utils = require("null-ls.utils")

-- for conciseness
local formatting = null_ls.builtins.formatting -- to setup formatters
local diagnostics = null_ls.builtins.diagnostics -- to setup linters

-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- configure null_ls
null_ls.setup({
	-- add package.json as identifier for root (for typescript monorepos)
	root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),
	-- setup formatters & linters
	sources = {
		--  to disable file types use
		formatting.eslint_d, -- js/ts formatter
		formatting.prettierd, -- js/ts formatter
		formatting.stylua, -- lua formatter
		diagnostics.eslint_d.with({ -- js/ts linter
			condition = function(utils)
				return utils.root_has_file({ ".eslintrc.js", ".eslintrc" }) -- only enable if root has .eslintrc.js or .eslintrc.cjs
			end,
		}),
		null_ls.builtins.diagnostics.cspell,
		null_ls.builtins.code_actions.cspell,
	},
	-- configure format on save
	on_attach = function(current_client, bufnr)
		if current_client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						filter = function(client)
							--  only use null-ls for formatting instead of lsp server
							return client.name == "null-ls"
						end,
						bufnr = bufnr,
					})
				end,
			})
		end
	end,
})

-- Define a Lua function to format CURL
function ParseCurl()
	local start_line = vim.fn.line("'<")
	local end_line = vim.fn.line("'>")
	local data, data_line

	for line_num = start_line, end_line do
		local line = vim.fn.getline(line_num)
		local header = line:match("-H '([^']+)'")
		local endpoint = line:match("curl '([^']+)'")

		if header then
			vim.fn.setline(line_num, header)
		elseif endpoint then
			vim.fn.setline(line_num, endpoint)
		else
			local match = line:match("'([^']*)'")
			if match then
				data = match
				data_line = line_num
			else
				vim.fn.setline(line_num, "")
			end
		end
	end
	if data then
		vim.fn.setline(data_line, "")
		vim.fn.setline(data_line + 1, data)
	end
end

vim.cmd([[
  command! -range FormatJson :<line1>,<line2>!jq .
  command! -range ParseCurl :lua ParseCurl()
]])

vim.api.nvim_set_keymap("x", "fm", [[:FormatJson<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "fp", [[:ParseCurl<CR>]], { noremap = true, silent = true })
