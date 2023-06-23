#!/bin/bash

# install dependencies
yay -S zsh git zsh-completions curl wget ttf-dejavu ttf-meslo-nerd-font-powerlevel10k nerd-fonts-complete

# install omzsh and change shell
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://gitlab.uni-oldenburg.de/fili6799/dotfiles.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/last-working-dir

# link stuff
# run configure command
