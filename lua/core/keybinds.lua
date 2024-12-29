-- Keybinds
vim.g.mapleader = " "

local function cmd(name, func)
	local id = name:gsub("(%w)(%w*)", function(first, rest)
		return first:upper() .. rest:lower() -- title case
	end):gsub("[^0-9A-Za-z]", "")
	vim.api.nvim_create_user_command(id, func, {})
	return id
end
local function map(mode, keystroke, out, desc, ...)
	if mode == "all" then
		mode = { "n", "v", "x", "s", "o", "i", "l", "c", "t" }
	end
	if type(mode) ~= "table" then
		mode = { mode }
	end
	if type(keystroke) ~= "table" then
		keystroke = { keystroke }
	end
	if type(out) == "function" then
		local id = cmd(desc, out)
		out = "<cmd>" .. id .. "<CR>"
	end

	local args = { ... }
	if args[1] == nil then
		args[1] = {}
	end

	for _, m in ipairs(mode) do
		for _, k in ipairs(keystroke) do
			vim.api.nvim_set_keymap(m, k, out, vim.tbl_extend("force", {
				noremap = true,
				silent = true,
				desc = desc,
			}, args[1]))
		end
	end
end

-- Reminiscent of kitty keybinds, some are overriden from my kitty config, but they work in neovide and other terminals

map("n", "<C-`>", "<cmd>BufferLineCycleNext<CR>", "Next tab")
map("n", "<C-Tab>", "<cmd>BufferLineCycleNext<CR>", "Next tab")
map("n", "<C-Right>", "<cmd>BufferLineCycleNext<CR>", "Next tab")
map("n", "<C-S-Right>", "<cmd>BufferLineCycleNext<CR>", "Next tab")

map("n", "<C-S-`>", "<cmd>BufferLineCyclePrev<CR>", "Previous tab")
map("n", "<C-S-Tab>", "<cmd>BufferLineCyclePrev<CR>", "Previous tab")
map("n", "<C-Left>", "<cmd>BufferLineCyclePrev<CR>", "Previous tab")
map("n", "<C-S-Left>", "<cmd>BufferLineCyclePrev<CR>", "Previous tab")

map("n", "<C-.>", "<cmd>BufferLineMoveNext<CR>", "Move tab right")
map("n", "<C-S-.>", "<cmd>BufferLineMoveNext<CR>", "Move tab right")

map("n", "<C-,>", "<cmd>BufferLineMovePrev<CR>", "Move tab left")
map("n", "<C-S-,>", "<cmd>BufferLineMovePrev<CR>", "Move tab left")

-- ^W switches windows in vim, so ^Q is used instead
map("n", "<C-Q>", "<cmd>bd<CR>", "Close buffer")
map("n", "<C-S-Q>", "<cmd>bd<CR>", "Close buffer")
map("n", "<C-T>", "<cmd>enew<CR>", "New buffer")
map("n", "<C-S-T>", "<cmd>enew<CR>", "New buffer")

local rename = function()
	require("renamer").rename()
end

-- Rename
map("i", "<C-K><C-R>", rename, "Rename")
map("n", "<C-K><C-R>", rename, "Rename")
map("v", "<C-K><C-R>", rename, "Rename")

-- Disable middle mouse button paste
map("all", { "<MiddleMouse>", "<2-MiddleMouse>", "<3-MiddleMouse>", "<4-MiddleMouse>" }, "")

-- Other keybinds
map("n", "<C-O>", "<cmd>NvimTreeToggle<CR>", "Toggle tree view")
map("n", "<C-S-O>", "<cmd>NvimTreeFindFile<CR>", "Focus current file in tree view")
map("n", { "<D-s>", "<D-S>", "<Leader>t" }, "<cmd>ToggleTerm direction=horizontal<CR>", "Toggle terminal")
map("n", "<Leader>g", function()
	local line = vim.fn.input("Go to line: ")
	if tonumber(line, 10) ~= nil then
		vim.cmd("<cmd>" .. line)
	else
		print("Not a number")
	end
end, "Go to line")

-- Telescope keybinds
map("n", "fr", function()
	require("telescope").extensions.projects.projects({})
end, "Find projects")
map("n", "fh", function()
	require("telescope.builtin").oldfiles()
end, "File history")

map("n", "<C-/>", '<cmd>let @/ = ""<CR>', "Clear search query")
map("n", "<C-S-/>", '/\\<\\><Left><Left>', "Search word", { silent = false })
map("n", "<C-Up>", "g<Up>", "Go up visual line")
map("n", "<C-Down>", "g<Down>", "Go down visual line")
map("n", "<C-Backspace>", "db", "Backspace word")
map("n", "<C-Delete>", "dw", "Delete word")
map("n", "<C-F>", "/", "Search", { silent = false })
map("n", "<C-U>", "<cmd>set nowrap!<CR>", "Toggle word wrapping")
map("n", "<C-S>", "<cmd>w<CR>", "Save")
map({ "n", "v" }, "<C-K><C-D>", "<cmd>Format<CR>", "Format")

map("n", "<Leader>f", "zf%", "Fold brackets")
