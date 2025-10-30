return function()
	local filetypes = "formatter.filetypes."
	require("formatter").setup({
		logging = true,
		log_level = vim.log.levels.WARN,
		-- full list at https://github.com/mhartington/formatter.nvim/tree/master/lua/formatter/filetypes
		filetype = {
			lua = { require(filetypes .. "lua").stylua },
			c = { require(filetypes .. "c").clangformat },
			cpp = { require(filetypes .. "cpp").clangformat },
			cs = { require(filetypes .. "cs").dotnetformat },
			json = { require(filetypes .. "json").jq },
			sh = { require(filetypes .. "sh").shfmt },
			rust = { require(filetypes .. "rust").rustfmt },
			typescript = require(filetypes .. "javascript").eslint_d,
			javascript = require(filetypes .. "javascript").eslint_d,
			html = { require(filetypes .. "html").tidy },
			css = { require(filetypes .. "css").cssbeautify },
			yaml = { require(filetypes .. "yaml").yamlfmt },
			xml = { require(filetypes .. "xml").xmllint },
			perl = { require(filetypes .. "perl").perltidy },
			python = { require(filetypes .. "python").black },
			nix = { require(filetypes .. "nix").nixfmt },
			["*"] = { require(filetypes .. "any").remove_trailing_whitespace },
		},
	})
end
