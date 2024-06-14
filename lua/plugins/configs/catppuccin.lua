return function()
	require("catppuccin").setup({
		flavour = "mocha",
		term_colors = true,
		transparent_background = vim.g.neovide == nil,
		integrations = {
			alpha = true,
			lsp_saga = true,
			treesitter = true,
			gitsigns = true,
			ts_rainbow = true,
			nvimtree = true,
			notify = true,
			telescope = true,
			cmp = true,
		},
		show_end_of_buffer = true,
	})

	vim.cmd.colorscheme("catppuccin")
end
