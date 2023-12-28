local o, g = vim.o, vim.g

-- Terminal cursor
-- o.guicursor = ""

-- Line numbers
o.number = true
o.relativenumber = true
o.number = 2

-- Clipboard
o.clipboard = "unnamedplus"

-- Indentation
o.autoindent = true
o.expandtab = false
o.shiftwidth = 4
o.smartindent = true
o.tabstop = 4
o.softtabstop = 4

-- Wildcard menu
o.wildmenu = true

-- Mouse
o.mouse = "a"

-- Disable netrw
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

o.foldenable = true
o.foldlevelstart = 5

-- Use terminal colours
o.termguicolors = true

-- Wrap moving cursor horizontal to next/previous lines
-- vim.opt.whichwrap:append("<>[]hl")

-- Use system notification daemon
g.notify_use_osc_24 = true
g.notify_send_via = "auto"

-- Neovide
vim.api.nvim_set_option_value("guifont", "Fira Code,Symbols Nerd Font,Twemoji:h12", {})
g.neovide_refresh_rate = 60
g.neovide_cursor_animation_length = 0.03
g.neovide_cursor_trail_length = 0.05
g.neovide_cursor_antialiasing = true
--g.neovide_transparency = 0.2
g.neovide_cursor_vfx_mode = "railgun"

-- Automatically open nvim-tree on startup if a file was specified
--if vim.fn.argc() > 0 then
--	vim.cmd([[
--		augroup NvimTreeAutoOpen
--			autocmd!
--			autocmd VimEnter * NvimTreeToggle
--		augroup END
--	]])
--end

vim.cmd("autocmd BufRead,BufNewFile *.fsh set filetype=c")
vim.cmd("autocmd BufRead,BufNewFile *.vsh set filetype=c")
vim.cmd("autocmd BufRead,BufNewFile *.glsl set filetype=c")
vim.cmd("autocmd BufRead,BufNewFile *.frag set filetype=c")
vim.cmd("autocmd BufRead,BufNewFile *.cu set filetype=c")
