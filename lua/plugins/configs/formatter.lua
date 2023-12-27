return function()
	require("formatter").setup({
		logging = true,
		log_level = vim.log.levels.WARN,
		filetype = {
			lua = { require("formatter.filetypes.lua").stylua },
			c = { require("formatter.filetypes.c").clangformat },
			cpp = { require("formatter.filetypes.cpp").clangformat },
			json = { require("formatter.filetypes.json").jq },
			sh = { require("formatter.filetypes.sh").shfmt },
			javascript = { require("formatter.filetypes.javascript").eslint_d },
			["*"] = { require("formatter.filetypes.any").remove_trailing_whitespace },
		},
	})
end
