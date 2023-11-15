return function()
	local ctp = require("catppuccin.palettes").get_palette()

	require("scrollbar").setup({
		handle = {
			color = ctp.surface1,
		},
		marks = {
			Search = { color = ctp.peach },
			Error = { color = ctp.red },
			Warn = { color = ctp.yellow },
			Info = { color = ctp.blue },
			Hint = { color = ctp.green },
			Misc = { color = ctp.purple },
		},
	})
end
