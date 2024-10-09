return function()
	require("catppuccin").setup({
		custom_highlights = function(colors)
			return {
				LineNr = { fg = colors.overlay1 },
			}
		end,
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
