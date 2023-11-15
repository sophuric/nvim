-- Keybinds
vim.g.mapleader = " "

local function map(mode, keystroke, out, desc)
	if mode == "all" then
		mode = { "n", "v", "x", "s", "o", "i", "l", "c", "t" }
	end
	if type(mode) ~= "table" then
		mode = { mode }
	end
	if type(keystroke) ~= "table" then
		keystroke = { keystroke }
	end
	for _, m in ipairs(mode) do
		for _, k in ipairs(keystroke) do
			vim.api.nvim_set_keymap(m, k, out, {
				noremap = true,
				silent = true,
				desc = desc,
			})
		end
	end
end
local function cmd(name, func)
	vim.api.nvim_create_user_command(name, func, {})
end

-- Tab keybinds, some are overriden by my kitty config, but not in neovide
map("n", "<C-`>", ":BufferLineCycleNext<CR>", "Next tab")
map("n", "<C-S-`>", ":BufferLineCyclePrev<CR>", "Previous tab")
map("n", "<C-Tab>", ":BufferLineCycleNext<CR>", "Next tab")
map("n", "<C-S-Tab>", ":BufferLineCyclePrev<CR>", "Previous tab")
map("n", "<C-.>", ":BufferLineMoveNext<CR>", "Move tab right")
map("n", "<C-S-.>", ":BufferLineMoveNext<CR>", "Move tab right")
map("n", "<C-,>", ":BufferLineMovePrev<CR>", "Move tab left")
map("n", "<C-S-,>", ":BufferLineMovePrev<CR>", "Move tab left")
map("n", "<C-Right>", ":BufferLineCycleNext<CR>", "Next Tab")
map("n", "<C-S-Right>", ":BufferLineCycleNext<CR>", "Next Tab")
map("n", "<C-Left>", ":BufferLineCyclePrev<CR>", "Previous tab")
map("n", "<C-S-Left>", ":BufferLineCyclePrev<CR>", "Previous tab")
map("n", "<C-W>", ":bd<CR>", "Close buffer")
map("n", "<C-S-W>", ":bd<CR>", "Close buffer")
map("n", "<C-T>", ":enew<CR>", "New buffer")
map("n", "<C-S-T>", ":enew<CR>", "New buffer")

-- Paste and copy
map("n", "<C-S-C>", "yy", "Copy")
map("v", "<C-S-C>", "y", "Copy")
map("n", "<C-S-V>", "vpi", "Paste")
map("i", "<C-S-V>", "<ESC>vpi", "Paste")

-- Disable middle mouse button paste
map("all", { "<MiddleMouse>", "<2-MiddleMouse>", "<3-MiddleMouse>", "<4-MiddleMouse>" }, "")

-- Functions
cmd("FindProjects", function()
	require("telescope").extensions.projects.projects({})
end)
cmd("FileHistory", function()
	require("telescope.builtin").oldfiles()
end)
cmd("PromptGoLine", function()
	local line = vim.fn.input("Go to line: ")
	if tonumber(line, 10) ~= nil then
		vim.cmd(":" .. line)
	else
		print("Not a number")
	end
end)

-- Other keybinds
map("n", "<C-O>", ":NvimTreeToggle<CR>", "Toggle tree view")
map("n", "<C-S-O>", ":NvimTreeFindFile<CR>", "Focus current file in tree view")
map("n", "<C-D>", ":ToggleTerm direction=horizontal<CR>", "Toggle terminal")
map("n", "<C-G>", ":PromptGoLine<CR>", "Go to line")

cmd("Reload", function()
	vim.cmd(":source $MYVIMRC")
end)
map("n", "fr", ":FindProjects<CR>", "Find projects")
map("n", "fh", ":FileHistory<CR>", "Search File History")

map("n", "<C-/>", ':let @/ = ""<CR>', "Clear search query")
map("n", "<C-Up>", "g<Up>", "Go up visual line")
map("n", "<C-Down>", "g<Down>", "Go down visual line")
map("n", "<C-Backspace>", "db", "Backspace word")
map("n", "<C-Delete>", "dw", "Delete word")
map("n", "<C-F>", "/", "Search")
map("n", "<C-U>", ":set nowrap!<CR>", "Toggle word wrapping")
map("n", "<C-S>", ":w<CR>", "Save")
map("n", "<C-K><C-D>", ":Format<CR>", "Format")
