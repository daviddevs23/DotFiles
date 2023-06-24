#!/bin/bash

yay -S neovim
yay -S clang llvm llvm-libs python3 python-pip pyright rust cargo go gopls bash-language-server pandoc typescript-language-server eslint-language-server lua-language-server

ln -s $HOME/DotFiles/system/neovim/nvim $HOME/.config/
