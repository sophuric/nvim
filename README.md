Neovim config

Required packages:
- `imagemagick` `lua51`
- `gopls` `pyright` `eslint` `eslint_d` `tree-sitter` `typescript-language-server` `clang` `go` `ltex-ls` `libxml2` `shfmt` `jq` `stylua` `tidy` `perl-tidy` `yamlfmt` (language servers and formatters)
- `python3`
- `black` `cssbeautifier` (from pip) or `python-black` `python-cssbeautifier` (from pacman)
- `npm` `unzip` `zip`

Install using pacman:
- `pacman -S imagemagick lua51 gopls pyright eslint eslint_d tree-sitter typescript-language-server clang go libxml2 shfmt jq stylua tidy yamlfmt perl-tidy python3 python-black python-cssbeautifier npm unzip zip` (as root)
- `paru -S ltex-ls-bin` (from AUR)

Install using python:
- `pip3 install black pyaml cssbeautifier` (from pip, ignore if using pacman)

