return function()
	require("colorizer").setup({
		"*",
	}, {
		mode = "background",
		RGB = true,
		RRGGBB = true,
		names = true,
		RRGGBBAA = true,
		AARRGGBB = true,
		rgb_fn = true,
		hsl_fn = true,
		css = true,
		css_fn = true,
	})
end
