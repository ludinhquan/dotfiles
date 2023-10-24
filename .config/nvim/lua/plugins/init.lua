local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local isInstalled = vim.loop.fs_stat(lazypath)
if not isInstalled then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("plugins.floatterm")

local plugins = {
	{ "nvim-lua/plenary.nvim", lazy = true },
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{
		"romgrk/barbar.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		config = function()
			require("plugins.lualine")
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = { "InsertEnter" },
		dependencies = {
			"hrsh7th/nvim-cmp",
		},
		config = function()
			require("plugins.nvim-autopairs")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = { "windwp/nvim-ts-autotag" },
		config = function()
			require("plugins.nvim-treesitter")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("plugins.nvim-treesitter-text-objects")
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("plugins.colorizer")
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
		config = function()
			require("plugins.nvim-tree")
		end,
	},
	{
		"numToStr/Comment.nvim",
		event = { "InsertEnter" },
		config = function()
			require("plugins.comment")
		end,
	},
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("plugins.alpha-nvim")
		end,
	},
	-- {
	-- 	"nvim-telescope/telescope.nvim",
	-- 	cmd = "Telescope",
	-- 	dependencies = {
	-- 		"hrsh7th/nvim-cmp",
	-- 		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	-- 	},
	-- 	config = function()
	-- 		require("plugins.telescope")
	-- 	end,
	-- },
	-- {
	-- 	event = "VeryLazy",
	-- 	"junegunn/fzf.vim",
	-- 	dependencies = {
	-- 		"junegunn/fzf",
	-- 	},
	-- 	config = function()
	-- 		require("plugins.fzf")
	-- 	end,
	-- },
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("plugins.fzf")
		end,
	},
	{
		"karb94/neoscroll.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("plugins.neoscroll")
		end,
	},
	{
		"simeji/winresizer",
		cmd = "WinResizerStartResize",
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("plugins.nvim-surround")
		end,
	},
	{
		"mg979/vim-visual-multi",
		event = { "BufReadPre", "BufNewFile" },
		branch = "master",
	},
	{
		"prisma/vim-prisma",
		ft = "prisma",
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"rest-nvim/rest.nvim",
		event = "VeryLazy",
		config = function()
			require("plugins.nvim-rest")
		end,
	},
	{
		"phaazon/hop.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("plugins.hop")
		end,
	},
	-- {
	-- 	"pwntester/octo.nvim",
	-- 	cmd = "Octo",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-telescope/telescope.nvim",
	-- 		"nvim-tree/nvim-web-devicons",
	-- 	},
	-- 	config = function()
	-- 		require("plugins.octo")
	-- 	end,
	-- },
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("plugins.gitsigns")
		end,
	},
	{
		"rmagatti/auto-session",
		event = "VeryLazy",
		config = function()
			require("plugins.auto-session")
		end,
	},
	-- {
	--   'neoclide/coc.nvim',
	--   branch = 'release',
	--   config = function ()
	--     require('plugins.configs.coc')
	--   end
	-- },
	{
		"williamboman/mason.nvim",
		event = "VeryLazy",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"jayp0521/mason-null-ls.nvim",
		},
		config = function()
			require("plugins.lsp.mason")
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim", -- configure formatters & linters
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("plugins.lsp.null-ls")
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			{ "antosha417/nvim-lsp-file-operations", config = true },
		},
		config = function()
			require("plugins.lsp.lspconfig")
		end,
	},
	{
		"nvimdev/lspsaga.nvim",
		event = { "LspAttach" },
		config = function()
			require("plugins.lsp.lspsaga")
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter", -- optional
			"nvim-tree/nvim-web-devicons", -- optional
		},
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-buffer", -- source for text in buffer
			"hrsh7th/cmp-path", -- source for file system paths
			"L3MON4D3/LuaSnip", -- snippet engine
			"saadparwaiz1/cmp_luasnip", -- for autocompletion
			"rafamadriz/friendly-snippets", -- useful snippets
			"onsails/lspkind.nvim", -- vs-code like pictograms
		},
		config = function()
			require("plugins.nvim-cmp")
		end,
	},
	{
		"tpope/vim-dadbod",
		cmd = "DBUIToggle",
		dependencies = {
			"kristijanhusak/vim-dadbod-ui",
			"kristijanhusak/vim-dadbod-completion",
		},
		config = function()
			require("plugins.dadbod")
		end,
	},
	{
		"salkin-mada/openscad.nvim",
		event = "VeryLazy",
		dependencies = {
			"junegunn/fzf.vim",
			"L3MON4D3/LuaSnip",
		},
		config = function()
			require("openscad")
			-- load snippets, note requires
			vim.g.openscad_load_snippets = true
		end,
	},
	-- {
	-- 	"javiorfo/nvim-ship",
	-- 	lazy = true,
	-- 	ft = "ship",
	-- 	cmd = { "ShipCreate", "ShipCreateEnv" },
	-- 	dependencies = { "javiorfo/nvim-spinetta", "javiorfo/nvim-popcorn" },
	-- 	config = function()
	-- 		require("plugins.nvim-ship")
	-- 	end,
	-- },
	-- {
	-- 	"folke/noice.nvim",
	-- 	event = "VeryLazy",
	-- 	config = function()
	-- 		require("plugins.noice")
	-- 	end,
	-- 	dependencies = {
	-- 		"MunifTanjim/nui.nvim",
	-- 	},
	-- },
}

require("lazy").setup(plugins, {})
