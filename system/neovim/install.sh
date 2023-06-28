#!/bin/bash

yay -S neovim fzf tree-sitter
yay -S clang llvm llvm-libs python3 python-pip pyright rust cargo go gopls bash-language-server pandoc typescript-language-server eslint-language-server lua-language-server
yay -S pandoc nodejs-live-server
yay -S noto-fonts-alpha noto-fonts-config-files noto-fonts-full-variable-git noto-fonts-slim-vf noto-fonts-ar noto-fonts-emoji noto-fonts-full-variable-slim-git noto-fonts-tc noto-fonts-cjk noto-fonts-emoji-apple noto-fonts-hinted-git noto-fonts-tc-vf noto-fonts-cjk-hk-vf noto-fonts-emoji-blob noto-fonts-hk-vf noto-fonts-unhinted-git noto-fonts-cjk-jp-vf noto-fonts-emoji-flag-git noto-fonts-jp-vf noto-fonts-unhinted-variable-git noto-fonts-cjk-kr-vf noto-fonts-emoji-flags noto-fonts-kr-vf noto-fonts-unhinted-variable-slim-gitnoto-fonts-cjk-otf noto-fonts-emoji-git noto-fonts-lite noto-fonts-variable-ar noto-fonts-cjk-sc-vf noto-fonts-emoji-lollipop noto-fonts-main noto-fonts-variable-lite noto-fonts-cjk-tc-vf noto-fonts-extra noto-fonts-sc noto-fonts-vf noto-fonts-cjk-vf noto-fonts-full-git noto-fonts-sc-vf

ln -s $HOME/DotFiles/system/neovim/nvim $HOME/.config/
