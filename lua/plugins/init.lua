-- Load lazy
local lazy_path = vim.fn.stdpath("data") .. "lazy/lazy.nvim"
if not vim.loop.fs_stat(lazy_path) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazy_path,
	})
end

vim.opt.rtp:prepend(lazy_path)

-- Hacky as fuck fix to make image plugin work

local lr_path = vim.fn.system("luarocks path --global --lr-path")
local lr_cpath = vim.fn.system("luarocks path --global --lr-cpath")
if lr_path then
	package.path = package.path .. ";" .. lr_path
end
if lr_cpath then
	package.cpath = package.cpath .. ";" .. lr_cpath
end

-- Lazy settings
local lazy_settings = {
	git = {
		timeout = 300,
	},
	install = {
		colorscheme = { "catppuccin" },
	},
	ui = {
		border = "rounded",
	},
}

-- Lazy plugins
local lazy_plugins = {
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		config = require("plugins.configs.catppuccin"),
		priority = 99,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = function()
			if #vim.api.nvim_list_uis() ~= 0 then
				vim.api.nvim_command("TSUpdate")
			end
		end,
		event = { "BufReadPre" },
		dependencies = {
			{ "andymass/vim-matchup" },
			{ "mrjones2014/nvim-ts-rainbow" },
		},
		config = require("plugins.configs.treesitter"),
	},
	{
		"andweeb/presence.nvim",
		config = require("plugins.configs.presence"),
		enabled = false,
	},
	{
		"akinsho/bufferline.nvim",
		after = "catppuccin",
		version = "v3.*",
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
		},
		lazy = false,
		event = { "BufReadPost", "BufAdd", "BufNewFile" },
		config = require("plugins.configs.bufferline"),
	},
	{
		"nvim-tree/nvim-tree.lua",
		lazy = false,
		cmd = {
			"NvimTreeToggle",
			"NvimTreeOpen",
			"NvimTreeFindFile",
			"NvimTreeFindFileToggle",
			"NvimTreeRefresh",
		},
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
		},
		config = require("plugins.configs.tree"),
	},
	{
		"ibhagwan/smartyank.nvim",
		lazy = true,
		event = "BufReadPost",
		config = require("plugins.configs.smartyank"),
	},
	{
		"tpope/vim-fugitive",
		lazy = true,
		cmd = { "Git", "G" },
	},
	{
		"akinsho/toggleterm.nvim",
		lazy = true,
		cmd = {
			"ToggleTerm",
			"ToggleTermSetName",
			"ToggleTermToggleAll",
			"ToggleTermSendVisualLines",
			"ToggleTermSendCurrentLine",
			"ToggleTermSendVisualSelection",
		},
		config = require("plugins.configs.toggleterm"),
	},
	{
		"nvim-telescope/telescope.nvim",
		lazy = true,
		cmd = "Telescope",
		config = require("plugins.configs.telescope"),
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			{
				"ahmedkhalf/project.nvim",
				event = "BufReadPost",
				config = require("plugins.configs.project"),
			},
			{ "jvgrootveld/telescope-zoxide" },
			{ "nvim-lua/plenary.nvim" },
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		lazy = false,
		event = { "BufReadPost", "BufAdd", "BufNewFile" },
		config = require("plugins.configs.lualine"),
	},
	{
		"hrsh7th/nvim-cmp",
		lazy = false,
		event = "InsertEnter",
		config = require("plugins.configs.cmp"),
		dependencies = {
			{ "ray-x/cmp-treesitter" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "hrsh7th/cmp-cmdline" },
			{ "lukas-reineke/cmp-under-comparator" },
			{ "f3fora/cmp-spell" },
			{
				"L3MON4D3/LuaSnip",
				dependencies = { "rafamadriz/friendly-snippets" },
				config = require("plugins.configs.luasnip"),
			},
			{ "onsails/lspkind.nvim" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "kdheepak/cmp-latex-symbols" },
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		event = { "BufReadPost", "BufAdd", "BufNewFile" },
		config = require("plugins.configs.lsp"),
		dependencies = {
			{ "ray-x/lsp_signature.nvim" },
			{ "mfussenegger/nvim-jdtls" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			{
				"glepnir/lspsaga.nvim",
				config = require("plugins.configs.lspsaga"),
			},
		},
	},
	{
		"norcalli/nvim-colorizer.lua",
		lazy = false,
		config = require("plugins.configs.colorizer"),
	},
	{
		"petertriho/nvim-scrollbar",
		lazy = false,
		config = require("plugins.configs.scrollbar"),
	},
	{
		"github/copilot.vim",
		lazy = false,
	},
	{
		"mhartington/formatter.nvim",
		lazy = false,
		config = require("plugins.configs.formatter"),
	},
	{
		"filipdutescu/renamer.nvim",
		config = require("plugins.configs.renamer"),
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
		},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = require("plugins.configs.autopairs"),
	},
	{
		"rcarriga/nvim-notify",
		lazy = true,
		event = "VeryLazy",
		config = require("plugins.configs.notify"),
	},
	{
		"3rd/image.nvim",
		lazy = true,
		event = "VeryLazy",
		config = require("plugins.configs.image"),
	},
}

require("lazy").setup(lazy_plugins, lazy_settings)
