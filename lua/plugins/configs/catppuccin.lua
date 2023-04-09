return function()
	require("catppuccin").setup({
		flavour = "mocha",
		term_colors = true,
		transparent_background = vim.g.neovide == nil,
		integrations = {
			treesitter = true,
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
