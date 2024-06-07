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
map("n", "<C-`>", "<cmd>BufferLineCycleNext<CR>", "Next tab")
map("n", "<C-S-`>", "<cmd>BufferLineCyclePrev<CR>", "Previous tab")
map("n", "<C-Tab>", "<cmd>BufferLineCycleNext<CR>", "Next tab")
map("n", "<C-S-Tab>", "<cmd>BufferLineCyclePrev<CR>", "Previous tab")
map("n", "<C-.>", "<cmd>BufferLineMoveNext<CR>", "Move tab right")
map("n", "<C-S-.>", "<cmd>BufferLineMoveNext<CR>", "Move tab right")
map("n", "<C-,>", "<cmd>BufferLineMovePrev<CR>", "Move tab left")
map("n", "<C-S-,>", "<cmd>BufferLineMovePrev<CR>", "Move tab left")
map("n", "<C-Right>", "<cmd>BufferLineCycleNext<CR>", "Next Tab")
map("n", "<C-S-Right>", "<cmd>BufferLineCycleNext<CR>", "Next Tab")
map("n", "<C-Left>", "<cmd>BufferLineCyclePrev<CR>", "Previous tab")
map("n", "<C-S-Left>", "<cmd>BufferLineCyclePrev<CR>", "Previous tab")
map("n", "<C-W>", "<cmd>bd<CR>", "Close buffer")
map("n", "<C-S-W>", "<cmd>bd<CR>", "Close buffer")
map("n", "<C-T>", "<cmd>enew<CR>", "New buffer")
map("n", "<C-S-T>", "<cmd>enew<CR>", "New buffer")

-- Paste and copy
map("n", "<C-S-C>", "yy", "Copy")
map("v", "<C-S-C>", "y", "Copy")
map("n", "<C-S-V>", "vpi", "Paste")
map("i", "<C-S-V>", "<ESC>vpi", "Paste")

-- Rename
map("i", "<C-K><C-R>", "<cmd>lua require(\"renamer\").rename()<CR>", "Paste")
map("n", "<C-K><C-R>", "<cmd>lua require(\"renamer\").rename()<CR>", "Paste")
map("v", "<C-K><C-R>", "<cmd>lua require(\"renamer\").rename()<CR>", "Paste")

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
		vim.cmd("<cmd>" .. line)
	else
		print("Not a number")
	end
end)

-- Other keybinds
map("n", "<C-O>", "<cmd>NvimTreeToggle<CR>", "Toggle tree view")
map("n", "<C-S-O>", "<cmd>NvimTreeFindFile<CR>", "Focus current file in tree view")
map("n", "<C-D>", "<cmd>ToggleTerm direction=horizontal<CR>", "Toggle terminal")
map("n", "<C-G>", "<cmd>PromptGoLine<CR>", "Go to line")

cmd("Reload", function()
	vim.cmd("<cmd>source $MYVIMRC")
end)
map("n", "fr", "<cmd>FindProjects<CR>", "Find projects")
map("n", "fh", "<cmd>FileHistory<CR>", "Search File History")

map("n", "<C-/>", '<cmd>let @/ = ""<CR>', "Clear search query")
map("n", "<C-Up>", "g<Up>", "Go up visual line")
map("n", "<C-Down>", "g<Down>", "Go down visual line")
map("n", "<C-Backspace>", "db", "Backspace word")
map("n", "<C-Delete>", "dw", "Delete word")
map("n", "<C-F>", "/", "Search")
map("n", "<C-U>", "<cmd>set nowrap!<CR>", "Toggle word wrapping")
map("n", "<C-S>", "<cmd>w<CR>", "Save")
map("n", "<C-K><C-D>", "<cmd>Format<CR>", "Format")

map("n", "!!", "zf%", "Fold brackets")
