-- import lspconfig plugin
local lspconfig = require("lspconfig")

-- import cmp-nvim-lsp plugin
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local keymap = vim.keymap -- for conciseness

local opts = { noremap = true, silent = true }
local on_attach = function(_, bufnr)
	opts.buffer = bufnr

	-- set keybinds
	opts.desc = "Show LSP references"
	keymap.set("n", "gr", "<cmd>Lspsaga finder tyd+ref+imp+def<CR>", opts) -- show definition, references

	opts.desc = "Show LSP definitions"
	keymap.set("n", "gD", "<cmd>Lspsaga peek_definition<CR>", opts) -- show lsp definitions

	opts.desc = "Show LSP definitions"
	keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts) -- show lsp definitions

	opts.desc = "Show LSP implementations"
	keymap.set("n", "gi", "<cmd>Lspsaga finder imp<CR>", opts) -- show lsp implementations

	opts.desc = "See available code actions"
	keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions, in visual mode will apply to selection

	opts.desc = "Rename"
	keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename

	opts.desc = "Show diagnostics"
	keymap.set("n", "<leader>dc", "<cmd>Lspsaga show_cursor_diagnostics <CR>", opts) -- show  diagnostics for file
	keymap.set("n", "<leader>dl", "<cmd>Lspsaga show_line_diagnostics <CR>", opts) -- show  diagnostics for file
	keymap.set("n", "<leader>db", "<cmd>Lspsaga show_buf_diagnostics <CR>", opts) -- show  diagnostics for file
	keymap.set("n", "<leader>dw", "<cmd>Lspsaga Lspsaga show_workspace_diagnostics <CR>", opts) -- show  diagnostics for file

	opts.desc = "Outline"
	keymap.set("n", "<leader>co", "<cmd>Lspsaga outline<CR>", opts) -- jump to previous diagnostic in buffer

	opts.desc = "Go to previous diagnostic"
	keymap.set("n", "[a", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer

	opts.desc = "Go to next diagnostic"
	keymap.set("n", "]a", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to previous diagnostic in buffer

	opts.desc = "Show documentation for what is under cursor"
	keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor

	opts.desc = "Restart LSP"
	keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Change the Diagnostic symbols in the sign column (gutter)
-- (not in youtube nvim video)
local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

lspconfig["ts_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure lua server (with special settings)
lspconfig["lua_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = { -- custom settings for lua
		Lua = {
			-- make the language server recognize "vim" global
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				-- make language server aware of runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
				},
			},
		},
	},
})
