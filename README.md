Neovim config

Required packages:
- `imagemagick` `lua51` `luarocks`
- `gopls` `pyright` `eslint` `eslint_d` `tree-sitter` `typescript-language-server` `clang` `go` `ltex-ls-bin` `libxml2`
- `python3`
- `pyaml` (from pip) or `python-pyaml` (from pacman)
- `npm` `unzip` `zip`
- `magick` (from luarocks, see below)

Install using pacman:
- `pacman -S imagemagick luarocks gopls pyright eslint eslint_d tree-sitter typescript-language-server clang unzip zip go python python-pyaml npm` (as root)
- `paru -S ltex-ls-bin` (from AUR)

Install using luarocks:
- `luarocks install magick --global --lua-version=5.1` (as root)

Install using python:
- `pip3 install pyaml` (from pip, ignore if using pacman)

