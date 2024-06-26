Neovim config

Required packages:
- `imagemagick` `lua51` `luarocks`
- `gopls` `pyright` `eslint` `eslint_d` `tree-sitter` `typescript-language-server` `clang` `go` `ltex-ls` `libxml2` `shfmt` `jq` `stylua` `tidy` (language servers and formatters)
- `python3`
- `pyaml` `cssbeautifier` (from pip) or `python-pyaml` `python-cssbeautifier` (from pacman)
- `npm` `unzip` `zip`
- `magick` (from luarocks, see below)

Install using pacman:
- `pacman -S imagemagick lua51 luarocks gopls pyright eslint eslint_d tree-sitter typescript-language-server clang go libxml2 shfmt jq stylua tidy python3 python-pyaml python-cssbeautifier npm unzip zip` (as root)
- `paru -S ltex-ls-bin` (from AUR)

Install using luarocks:
- `luarocks install magick --global --lua-version=5.1` (as root)

Install using python:
- `pip3 install pyaml` (from pip, ignore if using pacman)

