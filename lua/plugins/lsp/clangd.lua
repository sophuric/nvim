return {
	cmd = { 'clangd', '--header-search=/usr/lib/modules/' .. vim.fn.system("uname -r") .. '/build/include/' },
}
