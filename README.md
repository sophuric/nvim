Neovim config

Required packages:
- `imagemagick` `lua51` `luarocks`
- `gopls` `pyright` `eslint` `eslint_d` `tree-sitter` `typescript-language-server` `clang` `go` `ltex-ls`
- `python3`
- `npm` `unzip` `zip`
- `magick` (from luarocks, see below)

Install with pacman:
- `pacman -S imagemagick luarocks gopls pyright eslint eslint_d tree-sitter typescript-language-server clang unzip zip go ltex-ls python npm` (as root)

Install with luarocks:
- `luarocks install magick --global --lua-version=5.1` (as root)

