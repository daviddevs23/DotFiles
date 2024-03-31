#!/bin/bash

yay -S zsh git zsh-completions curl wget ttf-dejavu ttf-meslo-nerd-font-powerlevel10k nerd-fonts

sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

ln -s $HOME/DotFiles/system/zsh/.zshrc $HOME/
